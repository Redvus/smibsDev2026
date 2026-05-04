import { defineConfig } from "vite";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig({
    root: path.resolve(__dirname, "src"),
    base: "/",
    server: {
        port: 5173,
        strictPort: true,
        host: true,
        cors: true,
        proxy: {
            "/@vite": { bypass: (req) => req.url },
            "/@fs": { bypass: (req) => req.url },
            "/js": { bypass: (req) => req.url },
            "/scss": { bypass: (req) => req.url },
            "/css": { bypass: (req) => req.url },
            "/fonts": { bypass: (req) => req.url },
            "/redult": "http://localhost:8080/redult/",
            "/redcon": "http://localhost:8080",
            "^/(?!@vite|@fs|js|scss|css|fonts).*$": "http://localhost:8080",
        },
    },
    // Для разработки не нужны build настройки
});
