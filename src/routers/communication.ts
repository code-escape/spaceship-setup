import express, {Request, Response} from "express";
import {decipher} from "../security";

const communicationRouter = express.Router()

communicationRouter.post('/communication', async (req: Request, res: Response) => {
    await fetch('http://localhost:3000/api/dashboard/{equipeId}/communication', {
        method: 'POST',
        headers: {
            'content-type': 'application/json',
        },
        body: JSON.stringify({
            ...req.body,
            message: decipher(req.body.message)
        })
    });

    res.status(202).json();
});

export default communicationRouter;
