import express, {Express, Request, Response} from 'express';
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
const HOST = process.env.HOST || 'http://localhost';
const PORT = parseInt(process.env.PORT || '4500');

app.get('/', (req: Request, res: Response) => {
    res.json({message: 'Express + TypeScript Server'});
});

app.listen(PORT, () => {
    console.log(`⚡️[server]: Server is running at ${HOST}:${PORT}`);
});
