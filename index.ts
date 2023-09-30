import express, {Express, Request, Response} from 'express';
import bodyParser from "body-parser";
import dotenv from 'dotenv';
import communicationRouter from "./src/routers/communication";

dotenv.config();

const app: Express = express();
const HOST = process.env.HOST || 'http://localhost';
const PORT = parseInt(process.env.PORT || '4500');

app.use(bodyParser.json())
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*')
    next()
})

app.use(communicationRouter);

app.get('/', (req: Request, res: Response) => {
    res.json({message: 'Express + TypeScript Server'});
});

app.listen(PORT, () => {
    console.log(`⚡️[server]: Server is running at ${HOST}:${PORT}`);
});
