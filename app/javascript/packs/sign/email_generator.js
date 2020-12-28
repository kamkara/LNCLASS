// au focus du champs contact, recupere le le matricule et construire 
//l'email et l'attribuer a son champs pour les eleve .



document.addEventListener('turbolinks;load', ()  => {
    
// Variables
let contact     = document.getElementById("student_contact");
let extension   = "@gmail.com";
let emailField  = document.getElementById("studente_email");
let matricule   = document.getElementById("student_matricule").value.replace(/ /g, "");
contact.addEventListener("onfocus",function(e){
    emailField.value = matricule+extension;
    console.log(emailField);
});

})