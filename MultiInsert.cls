public class MultiInsert {
    
   public List<ContactsWrapper> allContacts=new List<ContactsWrapper>();
    public String copyObj{get;set;}
    public string allContactsJSON{get;set;}   
    public MultiInsert(){          
        ContactsWrapper copyCon=new ContactsWrapper('','','+','-');      
        copyObj=JSON.serialize(copyCon);
        allContacts.add(copyCon);              
        allContactsJSON=JSON.serialize(allContacts);     
    }
    @RemoteAction
    public static void saveRecords(String cont){
        try{
         
            List<ContactsWrapper> tobeAddedd=new List<ContactsWrapper>();
            Set<Contact> c=new Set<Contact>();
            List<ContactsWrapper> cts=(List<ContactsWrapper>)JSON.deserialize(cont, List<ContactsWrapper>.class);         
            for(ContactsWrapper conObj : cts){             
                Product2 cc=new Product2(Name=conObj.fName,
                                       Description=conObj.lName);
                insert cc;
            }
            
        }catch(Exception ex){
                System.debug('Error '+ex);
            }
            
        }
        
        
    }
