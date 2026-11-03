import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig({
    plugins: [vue()],

    root: path.resolve(__dirname, "src"),
    base: "/",

    // НАСТРОЙКА ДЛЯ РАЗРАБОТКИ (важно!)
    server: {
        cors: true,
        hmr: {
            host: "localhost",
            port: 5173,
            // strictPort: true, // Добавьте эту опцию
            // origin: "http://localhost:5173", // Явно указываем origin
        },
        port: 5173,
        // Прокси запросов к MODX (чтобы работал API)
        proxy: {
            "/api": {
                target: "http://localhost:8080", // или ваш Docker-адрес
                changeOrigin: true,
            },
            "/assets": {
                target: "http://localhost:8080",
                changeOrigin: true,
            },
            "/webfonts": {
                target: "http://localhost:8080",
                changeOrigin: true,
            },
        },
    },

    build: {
        outDir: path.resolve(__dirname, "modx/assets/build"),
        emptyOutDir: true,
        cssCodeSplit: false,
        rollupOptions: {
            input: {
                main: path.resolve(__dirname, "src/js/main.js"), // главный JS файл
                style: path.resolve(__dirname, "src/scss/main.scss"),
            },
            output: {
                assetFileNames: (assetInfo) => {
                    const fileName = assetInfo.names[0];
                    if (fileName === "style.css") {
                        return "main.css";
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
                chunkFileNames: "[name]-[hash].js",
                entryFileNames: "[name].js",
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
