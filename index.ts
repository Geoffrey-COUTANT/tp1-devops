// @ts-ignore
import http from 'http';

function index() {
    const hostname = '0.0.0.0';
    const port = process.env.PING_LISTEN_PORT ? parseInt(process.env.PING_LISTEN_PORT) : 8000;

    const server = http.createServer((req, res) => {
        if (req.url === '/ping' && req.method === 'GET') {
            let json = JSON.stringify(req.rawHeaders);

            res.statusCode = 200;
            res.setHeader('Content-Type', 'application/json');
            res.end(json);

            return;
        }

        res.statusCode = 404;
        res.setHeader('Content-Type', 'text/plain');
        res.end('');
    });

    server.listen(port, hostname, () => {
        console.log(`Server running at http://${hostname}:${port}/`);
    });
}

index();