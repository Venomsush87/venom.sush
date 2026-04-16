public class SeacrhAcc_Aura {
    @AuraEnabled
    public static List<Account> search(String acc_Indus, String acc_Rating)
    {
        return [Select Name, Industry, Phone, Rating  from Account where Industry=:acc_Indus or Rating=:acc_Rating];
    }
}