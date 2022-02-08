//constante que contiene el id del cliente del proyecto que se creo en microsoft azure
const msalConfig = {
    auth: {
        clientId: '869053c3-e7c4-4bac-b68b-5123e112a77f',
    }
};
let msalInstance;


function msalInitialize() {
    msalInstance = new msal.PublicClientApplication(msalConfig);
}


//este metodo realiza un popup para realizar la autenticacion con correos enlazados con hotmail
function login() {
    if (!msalInstance) {
        console.error('msalInstance is not initialized');
        return;
    }
    msalInstance.loginPopup(
        {
            redirectUri: "http://localhost:64790/auth",
            scopes: ['user.read']
        }
    ).then(loginResponse => {
        console.log(loginResponse);
        window.location.href = 'http://localhost:64790/verificar-login'
    }).catch(error => {
        console.log(error);
    });
}

//este metodo se encarga de obtener datos del ususario que inicio sesion
function getCurrentUser() {
    if (!msalInstance) {
        return null;
    }
    const data = msalInstance.getAllAccounts();
    return data && data[0] ? {
        name: data[0]['name'],
        tenantId: data[0]['tenantId'],
        username: data[0]['username'],
    } : null;
}

function logout() {
    msalInstance.logout();
    window.location.href = 'http://localhost:64790/verificar-login'
}


//esta funcion se encarga de redireccionar a las paginas principales de cada rol del sistema
function redireccion(rol){
    switch (rol) {
        case 'administrador':
            window.location.href = 'http://localhost:64790/administrador-principal'
            break;
        case 'tutor':
            window.location.href = 'http://localhost:64790/tutor-par-inicio'
            break;
        case 'tutorado':
            window.location.href = 'http://localhost:64790/tutorado-inicio'
            break;
        default:
            window.location.href = 'http://localhost:64790/verificar-login'
            break;
      }
}