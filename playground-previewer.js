import { connectPlayground, login, installTheme } from '@wp-playground/client';

const themeZip = process.argv[ 0 ];
 
const client = await connectPlayground(
    // Any iframe:
    document.getElementById('wp'),
 
    // Playground remote URL:
    `https://wasm.wordpress.net/remote.html`
);
await client.isReady();
 
// Login the user as admin:
await login(client, 'admin', 'password');
 
// Implement fetchFromPr and make it return a File object
// const themeZip = await fetchFromPr( 510 );
 
// Install the theme
await installTheme( themeZip );

// async function fetchFromPr( prNumber ) {
//     // Fetch the PR zip from GitHub
//     // Return a File object
// }