const fs = require('fs');
const path = require('path');

// Ruta del directorio base
const baseDir = './'; // Cambia esta ruta si es necesario

// Lista de carpetas que quieres excluir
const excludedDirs = ['node_modules', '.git'];

// Función para mapear las carpetas y subcarpetas
function generateMarkdown(dir, level = 0) {
    const items = fs.readdirSync(dir);
    let markdown = '';

    items.forEach(item => {
        const fullPath = path.join(dir, item);
        const stats = fs.statSync(fullPath);

        // Verifica si es una carpeta y si no está en la lista de excluidos
        if (stats.isDirectory() && !excludedDirs.includes(item)) {
            markdown += `${'  '.repeat(level)}- **${item}/**\n`;  // Añade el nombre de la carpeta
            markdown += generateMarkdown(fullPath, level + 1);  // Recursión para subcarpetas
        }
    });

    return markdown;
}

// Genera el contenido en formato Markdown
const markdownContent = `# Índice del Repositorio\n\n${generateMarkdown(baseDir)}`;

// Guarda el resultado en un archivo README.md
fs.writeFileSync('README.md', markdownContent);

console.log('README.md generado con éxito!');
