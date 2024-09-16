import { Request, Response } from 'express';
import { PasswordRecoverService } from '../../services/users/PasswordRecoverService';
import { serializeBigInt } from '../../utils/serializeBigInt';

class PasswordRecoverController {
    private passwordRecoverService: PasswordRecoverService;

    constructor(passwordRecoverService: PasswordRecoverService) {
        this.passwordRecoverService = passwordRecoverService;
    }

    async handle(req: Request, res: Response) {
        try {
            const result = await this.passwordRecoverService.execute(req);

            if (typeof result === 'string') {
                return res.status(400).json({ error: result });
            }

            const message = serializeBigInt(result);
            return res.json({ success: true, message });
        } catch (error) {
            console.error('Error in PasswordRecoverController:', error);
            return res.status(500).json({ error: 'Internal server error' });
        }
    }
}

export { PasswordRecoverController };
