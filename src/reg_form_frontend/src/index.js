import { reg_form_backend } from "../../declarations/reg_form_backend";

document.querySelector("form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const button = e.target.querySelector("button");

    const name = document.getElementById("name").value.toString();
    const email = document.getElementById("email").value.toString();
    const password = document.getElementById("password").value.toString();
    const password2 = document.getElementById("passoord1").value.toString();

    button.setAttribute("disabled", true);

    // Interact with foo actor, calling the greet method
    const greeting = await reg_form_backend.greet(name);

    button.removeAttribute("disabled");

    document.getElementById("greeting").innerText = greeting;

    return false;
});
