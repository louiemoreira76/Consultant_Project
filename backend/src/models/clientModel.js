const generateId = () => {
  return Date.now().toString(36) + Math.random().toString(36).substring(2);
};

// simulação de banco de dados em memória
let clientes = [
  {
    id: generateId(),
    nome: 'Empresa Alpha Ltda',
    contato: 'João Silva',
    email: 'joao@alpha.com',
    telefone: '(11) 99999-1111',
    segmento: 'Tecnologia',
    status: 'ativo',
    createdAt: new Date().toISOString(),
  },
  {
    id: generateId(),
    nome: 'Beta Consultoria',
    contato: 'Maria Souza',
    email: 'maria@beta.com',
    telefone: '(11) 98888-2222',
    segmento: 'Finanças',
    status: 'ativo',
    createdAt: new Date().toISOString(),
  },
];

const ClienteModel = {
  findAll: () => clientes,

  findById: (id) => clientes.find((c) => c.id === id) || null,

  create: ({ nome, contato, email, telefone, segmento, status = 'ativo' }) => {
    const novo = {
      id: generateId(),
      nome,
      contato,
      email,
      telefone,
      segmento,
      status,
      createdAt: new Date().toISOString(),
    };
    clientes.push(novo);
    return novo;
  },

  update: (id, dados) => {
    const index = clientes.findIndex((c) => c.id === id);
    if (index === -1) return null;
    clientes[index] = { ...clientes[index], ...dados, id };
    return clientes[index];
  },

  delete: (id) => {
    const index = clientes.findIndex((c) => c.id === id);
    if (index === -1) return false;
    clientes.splice(index, 1);
    return true;
  },
};

module.exports = ClienteModel;