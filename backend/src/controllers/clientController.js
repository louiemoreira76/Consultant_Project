const ClienteModel = require('../models/clientModel.js');
const { success, error } = require('../utils/response.js');

const getAll = (req, res) => {
  try {
    const clientes = ClienteModel.findAll();
    return success(res, clientes, 200, `${clientes.length} cliente(s) encontrado(s)`);
  } catch (e) {
    return error(res, e.message);
  }
};

const getById = (req, res) => {
  try {
    const cliente = ClienteModel.findById(req.params.id);
    if (!cliente) return error(res, 'Cliente não encontrado', 404);
    return success(res, cliente);
  } catch (e) {
    return error(res, e.message);
  }
};

const create = (req, res) => {
  try {
    const { nome, contato, email, telefone, segmento, status } = req.body;
    if (!nome || !email) return error(res, 'Nome e email são obrigatórios', 400);

    const cliente = ClienteModel.create({ nome, contato, email, telefone, segmento, status });
    return success(res, cliente, 201, 'Cliente criado com sucesso');
  } catch (e) {
    return error(res, e.message);
  }
};

const update = (req, res) => {
  try {
    const cliente = ClienteModel.update(req.params.id, req.body);
    if (!cliente) return error(res, 'Cliente não encontrado', 404);
    return success(res, cliente, 200, 'Cliente atualizado com sucesso');
  } catch (e) {
    return error(res, e.message);
  }
};

const remove = (req, res) => {
  try {
    const deleted = ClienteModel.delete(req.params.id);
    if (!deleted) return error(res, 'Cliente não encontrado', 404);
    return success(res, null, 200, 'Cliente removido com sucesso');
  } catch (e) {
    return error(res, e.message);
  }
};

module.exports = { getAll, getById, create, update, remove };