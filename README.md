# Terminal
## Conectarse a consola de Truffle
truffle development

## Compilar contrato
compile
> En la carpeta build se podrá ver un archivo json como resultado de la compilacion

## Desplegar contrato
migrate
> Si el constructor tuviera parametros, puedo pasarselos modificando el archivo de migrations

## Interactuar con el contrato
const instance = await CrowdFounding.deployed();
instance.<methodName>()

## Ver direcciones de cuentas
const account = await web3.eth.getAccounts();

## Cambiar direccion desde la que se ejecuta un contrato
CrowdFounding.defaults({ from: '0x709e1EC4bb4D1975162d806D98F72f122A1E8F63' })

## Iniciar un proyecto nuevo
> http://trufflesuite.com/docs/truffle/quickstart.html

