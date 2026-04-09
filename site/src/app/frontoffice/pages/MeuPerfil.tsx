import { FrontofficeLayout } from '../components/FrontofficeLayout';
import { User, Save } from 'lucide-react';
import { useState } from 'react';

function MeuPerfil() {
  const [formData, setFormData] = useState({
    nome: 'Italo',
    sobrenome: 'Santos',
    email: 'italo.santos@example.com',
    novaSenha: '',
    confirmarSenha: '',
  });

  const handleChange = (field: string, value: string) => {
    setFormData((prev) => ({ ...prev, [field]: value }));
  };

  const handleSave = () => {
    // Handle save logic
    console.log('Saving profile:', formData);
  };

  return (
    <FrontofficeLayout activeItem="Meu Perfil">
      <div className="max-w-2xl mx-auto">
        {/* Page Title */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-[#0A2540] mb-2">Meu Perfil</h1>
          <p className="text-gray-600">Gerencie suas informações pessoais</p>
        </div>

        {/* Profile Card */}
        <div className="bg-white rounded-xl border border-gray-200 p-8">
          {/* Profile Icon */}
          <div className="flex justify-center mb-8">
            <div className="w-32 h-32 bg-gradient-to-br from-[#0A2540] to-[#1a3a5f] rounded-full flex items-center justify-center">
              <User className="w-16 h-16 text-white" />
            </div>
          </div>

          {/* Form Fields */}
          <div className="space-y-6">
            {/* Nome e Sobrenome */}
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Nome
                </label>
                <input
                  type="text"
                  value={formData.nome}
                  onChange={(e) => handleChange('nome', e.target.value)}
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
                  placeholder="Digite seu nome"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Sobrenome
                </label>
                <input
                  type="text"
                  value={formData.sobrenome}
                  onChange={(e) => handleChange('sobrenome', e.target.value)}
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
                  placeholder="Digite seu sobrenome"
                />
              </div>
            </div>

            {/* E-mail */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                E-mail
              </label>
              <input
                type="email"
                value={formData.email}
                onChange={(e) => handleChange('email', e.target.value)}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
                placeholder="seu@email.com"
              />
            </div>

            {/* Divider */}
            <div className="border-t border-gray-200 pt-6">
              <h3 className="text-lg font-semibold text-[#0A2540] mb-4">Alterar Senha</h3>
            </div>

            {/* Nova Senha */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Nova senha
              </label>
              <input
                type="password"
                value={formData.novaSenha}
                onChange={(e) => handleChange('novaSenha', e.target.value)}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
                placeholder="Digite sua nova senha"
              />
            </div>

            {/* Confirmar Senha */}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Confirmar senha
              </label>
              <input
                type="password"
                value={formData.confirmarSenha}
                onChange={(e) => handleChange('confirmarSenha', e.target.value)}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540]"
                placeholder="Confirme sua nova senha"
              />
            </div>

            {/* Save Button */}
            <div className="pt-4">
              <button
                onClick={handleSave}
                className="w-full px-6 py-3 bg-[#0A2540] text-white rounded-lg hover:bg-[#1a3a5f] transition-all font-medium flex items-center justify-center gap-2"
              >
                <Save className="w-5 h-5" />
                Salvar
              </button>
            </div>
          </div>
        </div>
      </div>
    </FrontofficeLayout>
  );
}

export default MeuPerfil;
