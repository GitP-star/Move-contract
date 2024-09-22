module send_message::Message {
    //architecture of program- imports,structs(resource),functions
    use std::string::{String,utf8};
    use std::signer;
    
    struct Message  has key{
        m: String
    } 
     
     public entry fun create_message(account:&signer,msg:String) acquires Message{
        let signer_address= signer::address_of(account);
        if(exists<Message>(signer_address)){
            let fetch_msg=borrow_global_mut<Message>(
                        signer_address
            );
            fetch_msg.m=msg;
        }
        else {
            let new_message= Message{
                m: msg
            };
            move_to(account,new_message);
        }
     }
}
