public class angularJSBasicControllerSetup {
    public String allProducts{get;set;}
    
    public angularJSBasicControllerSetup(){
        List<Product2> lstproducts =[select id,name,Apttus_Config2__ConfigurationType__c,Apttus_Config2__Uom__c from Product2 limit 1];
        allProducts=JSON.serialize(lstproducts);
    }
    @RemoteAction
    public static List<Product2> editProductToSalesforce(string product){
       Product2 prod =(Product2) JSON.deserialize(product, Product2.class);
       update prod;
       List<Product2> lstproducts =[select id,name,Apttus_Config2__ConfigurationType__c,Apttus_Config2__Uom__c from Product2 limit 1];
       return lstproducts;
    }
}
