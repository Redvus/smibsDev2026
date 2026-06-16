import { defineConfig } from "vite";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig({
    root: path.resolve(__dirname, "src"),
    base: "/",
    build: {
        outDir: path.resolve(__dirname, "modx/assets/build"),
        emptyOutDir: true,
        cssCodeSplit: false,
        rollupOptions: {
            input: {
                style: path.resolve(__dirname, "src/scss/main.scss"),
            },
            output: {
                assetFileNames: (assetInfo) => {
                    const fileName = assetInfo.names[0];
                    if (fileName === "style.css") {
                        return "css/app.css";
                    }
                    if (fileName && fileName.endsWith(".css")) {
                        return "css/[name][extname]";
                    }
                    if (
                        fileName &&
                        /\.(png|jpe?g|gif|svg|webp|ico)$/.test(fileName)
                    ) {
                        return "images/[name][extname]";
                    }
                    if (fileName && /\.(woff2?|ttf|otf|eot)$/.test(fileName)) {
                        return "fonts/[name][extname]";
                    }
                    return "assets/[name][extname]";
                },
            },
        },
    },
    assetsInclude: [
        "**/*.woff2",
        "**/*.woff",
        "**/*.ttf",
        "**/*.otf",
        "**/*.eot",
    ],
});
