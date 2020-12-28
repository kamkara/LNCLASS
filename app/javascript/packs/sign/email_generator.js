// au focus du champs contact, recupere le le matricule et construire 
//l'email et l'attribuer a son champs pour les eleve .

document.addEventListener("turbilinks;load", ()=>{
    document.getElementById("studentContact").addEventListener("focus",function(){
        //variables
        let extension = "@gmail.com";
        document.getElementById("studentEmail").value= document.getElementById("studentMatricule").value.replace(/ /g, "")+extension;
    });
})