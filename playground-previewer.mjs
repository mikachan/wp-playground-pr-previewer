import { connectPlayground, login, installTheme } from '@wp-playground/client';

const themeZipUrl = process.argv[ 0 ];
 
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
const themeZip = await fetchFromPr( themeZipUrl );
 
// Install the theme
await installTheme( themeZip );

async function fetchFromPr( url ) {
    const response = await fetch( url );
    const blob = await response.blob();
    const filename = url.substring( url.lastIndexOf('/') + 1 );
    return new File( [blob], filename );
}
