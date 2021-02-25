public class ObjNamesController {
    public List<SelectOption> options {get;set;}
    public String selected {get;set;}
    public Map<String,Schema.SObjectType> allObj = new Map<String,Schema.SObjectType>();
    public List<SelectOption> fieldNames {get;set;} 
    public String result{get;set;}
    
    public  ObjNamesController()
    {     
	   options = new List<SelectOption>();    
       
       //schema programming
       //Step 1: Get a Token
       allObj = Schema.getGlobalDescribe(); //Map of sObj names(keys) and token(values)

       for (String a: allObj.keyset() )
       {
       	SelectOption option = new SelectOption(a,a); //value,label
        options.add(option); 
       }
       options.sort();   
     
    }
    
    public void getFieldNames()
        
    {
       result =  selected;
       Schema.SObjectType objToken = allObj.get(selected); //Step 1: get Obj Token from Selected Obj
       Schema.DescribeSObjectResult dsr= objToken.getDescribe(); //Step 2: Call GetDescribe
        
      	Map<String,Schema.SObjectField> fieldMap = dsr.fields.getMap();//Get Map of fields
      	fieldNames = new List<SelectOption>();
        List<String> objNames = new List<String>(fieldMap.keySet());
        objNames.sort();
        //iterate over map keys - fieldnames
        for(String f: objNames)
        {
            SelectOption op = new SelectOption(f,f);
            fieldNames.add(op);
            
        }
    }
    
  
    
}