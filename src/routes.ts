import { Router } from 'express';
import { isAuthenticated } from './Middlewares/isAuthenticated';
import multer from 'multer';
import {
    createUserController,
    authUserController,
    logoutController,
    deleteUserController,
    updateUserController,
    changePswController,
    listarUserDadosController,
    getMediaController,
    uploadMediaController,
    criarTarefasController,
    listarTarefasController,
    editarTarefasController,
    deletarTarefasController,
    criarNegociacoesController,
    listarNegociacoesController,
    editarNegociacoesController,
    deletarNegociacoesController,
    criarClientePFController,
    listarClienteController,
    editarClientePFController,
    deletarClientePFController,
    criarClientePJController,
    editarClientePJController,
    deletarClientePJController,
    criarSeguradorasController,
    listarSeguradorasController,
    editarSeguradorasController,
    deletarSeguradorasController,
    criarContatoNegociacaoController,
    deletarContatoNegociacaoController,
    deletarPropostaNegociacaoController,
    editarPropostaNegociacaoController,
    editarContatoNegociacaoController,
    listarPropostaNegociacaoController,
    criarPropostaNegociacaoController,
    dashboardController,
    gerarCodPswController,
    verificarCodigoController,
    listarNotificacoesController,
    criarAnotacaoController,
    editarAnotacaoController,
    listarAnotacaoController,
    deletarAnotacaoController

} from './controllers';

const upload = multer();

const initializeRoutes = (): Router => {
    const router = Router();
    
    // User routes
    router.post('/user/cadastrar', createUserController.handle.bind(createUserController));
    router.post('/login', authUserController.handle.bind(authUserController));
    router.delete('/user/delete', isAuthenticated, deleteUserController.handle.bind(deleteUserController));
    router.put('/user/update/:id', isAuthenticated, updateUserController.handle.bind(updateUserController));
    router.get('/logout', isAuthenticated, logoutController.handle.bind(logoutController));
    router.get('/user/dados', isAuthenticated, listarUserDadosController.handle.bind(listarUserDadosController));
    router.get('/media', isAuthenticated, getMediaController.handle.bind(getMediaController));
    router.post('/upload-media', upload.single('media'), uploadMediaController.handle.bind(uploadMediaController));
    router.get('/dashboard', isAuthenticated, dashboardController.handle.bind(dashboardController));
    router.post('/password/codigo', gerarCodPswController.handle.bind(gerarCodPswController));
    router.post('/password/verificar/:userId', verificarCodigoController.handle.bind(verificarCodigoController));
    router.put('/password/change/:id', changePswController.handle.bind(changePswController));

    // Tarefas routes
    router.post('/tarefas/criar', isAuthenticated, criarTarefasController.handle.bind(criarTarefasController));
    router.get('/tarefas/listar', isAuthenticated, listarTarefasController.handle.bind(listarTarefasController));
    router.put('/tarefas/editar/:id', isAuthenticated, editarTarefasController.handle.bind(editarTarefasController));
    router.delete('/tarefas/deletar/:id', isAuthenticated, deletarTarefasController.handle.bind(deletarTarefasController));

    // Negociações routes
    router.post('/negociacoes/criar', isAuthenticated, criarNegociacoesController.handle.bind(criarNegociacoesController));
    router.get('/negociacoes/listar', isAuthenticated, listarNegociacoesController.handle.bind(listarNegociacoesController));
    router.put('/negociacoes/editar/:id', isAuthenticated, editarNegociacoesController.handle.bind(editarNegociacoesController));
    router.delete('/negociacoes/deletar/:id', isAuthenticated, deletarNegociacoesController.handle.bind(deletarNegociacoesController));

    // Clientes PF routes
    router.post('/cliente/pf/criar', isAuthenticated, criarClientePFController.handle.bind(criarClientePFController));
    router.get('/cliente/listar', isAuthenticated, listarClienteController.handle.bind(listarClienteController)); // Listar PF e PJ
    router.put('/cliente/pf/editar/:id', isAuthenticated, editarClientePFController.handle.bind(editarClientePFController));
    router.delete('/cliente/pf/deletar/:id', isAuthenticated, deletarClientePFController.handle.bind(deletarClientePFController));

    // Clientes PJ routes
    router.post('/cliente/pj/criar', isAuthenticated, criarClientePJController.handle.bind(criarClientePJController));
    router.put('/cliente/pj/editar/:id', isAuthenticated, editarClientePJController.handle.bind(editarClientePJController));
    router.delete('/cliente/pj/deletar/:id', isAuthenticated, deletarClientePJController.handle.bind(deletarClientePJController));

    // Seguradoras routes
    router.post('/seguradoras/criar', isAuthenticated, criarSeguradorasController.handle.bind(criarSeguradorasController));
    router.get('/seguradoras/listar', isAuthenticated, listarSeguradorasController.handle.bind(listarSeguradorasController));
    router.put('/seguradoras/editar/:id', isAuthenticated, editarSeguradorasController.handle.bind(editarSeguradorasController));
    router.delete('/seguradoras/deletar/:id', isAuthenticated, deletarSeguradorasController.handle.bind(deletarSeguradorasController));


    router.post('/contato-negociacao/criar', isAuthenticated, criarContatoNegociacaoController.handle.bind(criarContatoNegociacaoController));
    router.post('/proposta-negociacao/criar', isAuthenticated, criarPropostaNegociacaoController.handle.bind(criarPropostaNegociacaoController));
    router.delete('/contato-negociacao/deletar/:id', isAuthenticated, deletarContatoNegociacaoController.handle.bind(deletarContatoNegociacaoController));
    router.delete('/proposta-negociacao/deletar/:id', isAuthenticated, deletarPropostaNegociacaoController.handle.bind(deletarPropostaNegociacaoController));
    router.put('/contato-negociacao/editar/:id', isAuthenticated, editarContatoNegociacaoController.handle.bind(editarContatoNegociacaoController));
    router.put('/proposta-negociacao/editar/:id', isAuthenticated, editarPropostaNegociacaoController.handle.bind(editarPropostaNegociacaoController));
    router.get('/proposta-negociacao/listar', isAuthenticated, listarPropostaNegociacaoController.handle.bind(listarPropostaNegociacaoController));

    router.get('/notificacoes/listar/:userId', isAuthenticated, listarNotificacoesController.handle.bind(listarNotificacoesController));

    router.post('/anotacao/criar', criarAnotacaoController.handle.bind(criarAnotacaoController));
    router.put('/anotacao/editar/:id', editarAnotacaoController.handle.bind(editarAnotacaoController));
    router.get('/anotacao/listar', listarAnotacaoController.handle.bind(listarAnotacaoController));
    router.delete('/anotacao/deletar/:id', deletarAnotacaoController.handle.bind(deletarAnotacaoController));

    return router;
};

export const router = initializeRoutes();
