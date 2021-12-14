const msalConfig = {
    auth: {
        clientId: '869053c3-e7c4-4bac-b68b-5123e112a77f',
    }
};
let msalInstance;

function msalInitialize() {
    msalInstance = new msal.PublicClientApplication(msalConfig);
}

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