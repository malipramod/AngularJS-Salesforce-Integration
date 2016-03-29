public class apexDemo {
    public String allProducts{get;set;}
    public apexDemo(){
        List<Product2> prod=[select id,Name from Product2];
        allProducts=JSON.serialize(prod);
    }
    
    @RemoteAction
    public static List<Product2> addProduct(string product){
        Product2 prod=new Product2(
         Name=product
        );
       
        insert prod;
        
        List<Product2> prod1=[select id,Name from Product2];
        return prod1;
        
    }
}