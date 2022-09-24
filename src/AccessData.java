import java.sql.*;

public class AccessData
{
    private Connection co;
    private Statement st;
    private PreparedStatement pst;
    private final int TYPE = ResultSet.TYPE_SCROLL_INSENSITIVE;
    private final int MODE = ResultSet.CONCUR_UPDATABLE;

    public AccessData() throws ClassNotFoundException, SQLException
    {

    }

    /*
    --- SYSTEM METHODS ---
     */
    public String loadDriver() throws ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return "Driver loaded";
    }

    public String connection(String lgn, String pwd) throws SQLException {
        String url = "jdbc:oracle:thin:@charlemagne.iutnc.univ-lorraine.fr:1521:infodb";
        this.co = DriverManager.getConnection(url, lgn, pwd);
        return "Successfully connected to the database :)";
    }

    /*
    --- FEATURES --
     */
    public String listVehic(String categ, String stDate, String endDate) throws SQLException
    {
        this.pst = this.co.prepareStatement("SELECT distinct Vehicule.no_imm, Vehicule.modele \n" +
                "FROM Vehicule, Dossier\n" +
                "WHERE code_categ = ?\n" +
                "    AND (date_retrait < ? OR dossier.date_retour > ?)\n" +
                "    AND Vehicule.no_imm = Dossier.no_imm",
                TYPE, MODE);

        this.pstSet(pst, new String[]{categ, stDate, endDate});
        return this.displayPst();
    }

    public String majCal(String plate, String stDate, String endDate, int loc) throws SQLException
    {
        String locParam;
        this.pst = this.co.prepareStatement("UPDATE Calendrier \n" +
                "SET paslibre = ?\n" +
                "WHERE no_imm = ?\n" +
                "    AND datejour BETWEEN ? AND ?", TYPE, MODE);

        if (loc == 1) locParam = "x";
        else locParam = null;
        this.pstSet(pst, new String[]{locParam, plate, stDate, endDate});
        pst.executeUpdate();
        return plateCalendar(plate);
    }

    public String plateCalendar(String plate) throws SQLException
    {
        this.pst = this.co.prepareStatement("SELECT * FROM Calendrier WHERE no_imm = ?", TYPE, MODE);
        this.pstSet(pst, new String[]{plate});
        return "Booking calendar for this plate :\n" + this.displayPst();
    }

    public String locAmount(String model, String locDuration) throws SQLException
    {
        this.pst = this.co.prepareStatement("SELECT tarif.code_tarif, tarif_jour * MOD(?,7) + tarif_hebdo * FLOOR(?/7) AS Montant_location \n" +
                        "FROM tarif\n" +
                        "WHERE tarif.code_tarif = (\n" +
                        "    SELECT categorie.code_tarif FROM Vehicule, Categorie\n" +
                        "    WHERE vehicule.modele = ?\n" +
                        "        AND Vehicule.code_categ = categorie.code_categ\n)",
                TYPE, MODE);

        this.pstSet(pst, new String[]{locDuration, locDuration, model});
        return this.displayPst();
    }

    public String allCategsAgencies() throws SQLException
    {
        this.st = co.createStatement(TYPE, MODE);
        ResultSet rs = st.executeQuery("SELECT code_ag FROM Vehicule, Categorie\n" +
                "WHERE categorie.code_categ = vehicule.code_categ\n" +
                "GROUP BY code_ag\n" +
                "HAVING count(distinct Categorie.code_categ) = (\n" +
                "    SELECT count(*) \n" +
                "    FROM Categorie)");

        return display(rs);
    }

    public String cliList2Models() throws SQLException
    {
        this.st = co.createStatement(TYPE, MODE);
        ResultSet rs = st.executeQuery("SELECT nom, ville, codpostal\n" +
                "FROM Client, Dossier, Vehicule\n" +
                "WHERE Client.code_cli = Dossier.code_cli\n" +
                "    AND Dossier.no_imm = Vehicule.no_imm\n" +
                "GROUP BY nom, ville, codpostal, modele\n" +
                "HAVING count(modele) = 2");

        return display(rs);
    }

    /*
    --- DISPLAYING METHODS ---
     */
    public String display(ResultSet rs) throws SQLException
    {
        ResultSetMetaData rSMeta = rs.getMetaData();
        final int NUM = rSMeta.getColumnCount();

        StringBuilder sb = new StringBuilder();

        sb.append(showColsName(rSMeta, NUM));
        while (rs.next())
            sb.append(showRow(rs, NUM));
        return sb.toString();
    }

    public String displayPst() throws SQLException
    {
        ResultSet rs = pst.executeQuery();
        return display(rs);
    }

    public void pstSet(PreparedStatement pst, Object[] params) throws SQLException
    {
        for (int i = 0 ; i < params.length ; i ++)
            pst.setObject(i + 1, params[i]);
    }

    public String showRow(ResultSet rS, final int NUM) throws SQLException
    {
        StringBuilder res = new StringBuilder();
        for (int i = 1; i <= NUM ; i ++)
            res.append(rS.getString(i) + "\t");
        res.append("\n");
        return res.toString();
    }

    public String showColsName(ResultSetMetaData rSMeta, final int NUM) throws SQLException
    {
        StringBuilder res = new StringBuilder();
        for (int i = 1; i <= NUM ; i ++)
            res.append(rSMeta.getColumnName(i) + "\t");
        res.append("\n");
        return res.toString();
    }

    /*
    --- GETTERS, SETTERS ANS REDEFINITIONS ---
     */
    public Connection getCo() {
        return co;
    }

    @Override
    public String toString() {
        return "AccessData{" +
                "co=" + co +
                ", st=" + st +
                ", pst=" + pst +
                ", TYPE=" + TYPE +
                ", MODE=" + MODE +
                '}';
    }
}
