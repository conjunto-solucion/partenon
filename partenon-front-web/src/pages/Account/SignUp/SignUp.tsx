import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { provinces } from "utilities/constants";

//Componentes de formulario.
import { Button, Dropdown, Field, Form, Message } from 'components/formComponents';
import { Loading } from "components/standalone";
import { Div } from "components/wrappers";
import { BiHome } from "react-icons/bi";

//Relacionado a la cuenta.
import Valid from "utilities/Valid";
import account from './models/account';
import postAccount from "./services/postAccount";
import tryLogin from "../services/tryLogin";

/**Un formulario para crear una nueva cuenta de usuario.*/
export default function SignUp(): JSX.Element {

  const navigate = useNavigate();

  //Controladores del estado del formulario.
  const [loading, setLoading] = useState(false);

  /*DATOS DEL FORMULARIO*****************************************************/

  //Datos del usuario.
  const [username, setUsername]           = useState("");
  const [email, setEmail]                 = useState("");
  const [password, setPassword]           = useState("");
  const [passwordMatch, setPasswordMatch] = useState("");
  const [museumName, setMuseumName]       = useState("");
  const [province, setProvince]           = useState("Misiones");
  const [city, setCity]                   = useState("");
  const [street, setStreet]               = useState("");
  const [addressNumber, setAddressNumber] = useState();
  
  const [error, setError]                 = useState("");


  /*VALIDACIÓN***************************************************************/

  function userIsValid(): boolean {
    setError("");

    if (!Valid.names(username, setError))     return false;
    if (!Valid.email(email, setError))        return false;
    if (!Valid.password(password, setError))  return false;
    if (password !== passwordMatch) {setError("Las contraseñas no coinciden"); return false}

    if (!Valid.names(museumName)) {setError("El nombre del museo debe ser de entre 3 y 20 caracteres"); return false}
    if (!Valid.names(city)) {setError("El nombre de la ciudad debe ser de entre 3 y 20 caracteres");    return false}
    if (!Valid.names(street)) {setError("El nombre de la calle debe ser de entre 3 y 20 caracteres");   return false}
    if (!Valid.addressNumber(addressNumber, setError)) return false;

    return true;
  };


  /*ENVIAR Y RECIBIR*************************************************/

  /**Envía al servidor los datos recolectados. */
  async function submit(): Promise<void> {

    const account: account = {
      username: username,
      email: email,
      password: password,
      museumName: museumName,
      country: "",
      province: province,
      city: city,
      street: street,
      addressNumber: addressNumber
    }

    setLoading(true);
    postAccount(account).then(response=>{
      setLoading(false);

      if (!response.ok) return setError(response.content);
      else tryLogin(username, password).then(() => window.location.reload());
      
    })
  }

  /*FORMULARIO*****************************************************/

  return (
    <Form title="Creando nuevo museo" onSubmit={()=>{if (userIsValid()) submit()}}>
      <Link to="/"><BiHome /></Link>
          
      
      <Field label="¿Cómo quieres que te identifiquemos?" 
      bind={[username, setUsername]} validator={Valid.names(username)} />
      <Field label="Tu dirección de correo electrónico"
      bind={[email, setEmail]} validator={Valid.email(email)} />

      <Div flex>
        <Field label="Elige una contraseña" 
        bind={[password, setPassword]} type="password" validator={Valid.password(password)} />
        <Field label="Vuelve a escribir la contraseña" bind={[passwordMatch, setPasswordMatch]}
        type="password" validator={password===passwordMatch} />
      </Div>

      <Field label="¿Cómo se llamará tu museo?" bind={[museumName, setMuseumName]}
      validator={Valid.names(museumName)} />

      <Div flex>
        <Dropdown options={provinces} value={province} onChange={setProvince} />
      </Div>

      <Div flex>
        <Field label="Ciudad" bind={[city, setCity]}
        validator={Valid.names(city)} />
        <Field label="Calle" bind={[street, setStreet]}
        validator={Valid.names(street)} />
        <Field label="Altura" bind={[addressNumber, setAddressNumber]}
        validator={Valid.addressNumber(addressNumber)} />
      </Div>

            
      <Message type="error" message={error} />

      <Div flex justify='space-between'>
        <Link to="/ingresar">Acceder</Link>

        {loading?<Loading/>:<Button type="submit">Crear</Button>}
      </Div>

    </Form>
   
  );
}