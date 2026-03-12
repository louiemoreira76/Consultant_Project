const success = (res, data, statusCode = 200, message = 'Sucesso') => {
  return res.status(statusCode).json({ success: true, message, data });
};

const error = (res, message = 'Erro interno', statusCode = 500) => {
  return res.status(statusCode).json({ success: false, message });
};

module.exports = { success, error };