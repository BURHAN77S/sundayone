/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Students {
    
    public String firstName ;
    public String lastName ;
    public Integer classYear ;
    public String Major ;

    public String generateReport() {
        System.debug('Report Generated for: ' + firstName +' '+ lastName+' '+classYear);
        return Major;
    }
}