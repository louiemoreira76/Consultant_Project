import { FrontofficeLayout } from '../components/FrontofficeLayout';
import { BookOpen, CheckCircle2, Clock } from 'lucide-react';
import { useNavigate } from 'react-router';

function MeuProgresso() {
  const navigate = useNavigate();

  const trilhasEmAndamento = [
    {
      id: 1,
      name: 'Recuperação de Créditos Tributários',
      color: 'from-blue-500 to-blue-700',
    },
    {
      id: 2,
      name: 'Planejamento Societário',
      color: 'from-purple-500 to-purple-700',
    },
  ];

  const trilhasFinalizadas = [
    {
      id: 3,
      name: 'Introdução ao Direito Tributário',
      color: 'from-green-500 to-green-700',
    },
    {
      id: 4,
      name: 'Fundamentos de Contabilidade',
      color: 'from-orange-500 to-orange-700',
    },
  ];

  return (
    <FrontofficeLayout activeItem="Meu Progresso">
      {/* Page Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-[#0A2540] mb-2">Meu Progresso</h1>
        <p className="text-gray-600">Acompanhe sua evolução e conquistas</p>
      </div>

      {/* Progress Summary */}
      <div className="grid grid-cols-3 gap-6 mb-8">
        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 bg-blue-50 rounded-lg">
              <Clock className="w-5 h-5 text-blue-600" />
            </div>
            <p className="text-sm text-gray-600">Em Andamento</p>
          </div>
          <p className="text-3xl font-bold text-[#0A2540]">{trilhasEmAndamento.length}</p>
        </div>

        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 bg-green-50 rounded-lg">
              <CheckCircle2 className="w-5 h-5 text-green-600" />
            </div>
            <p className="text-sm text-gray-600">Concluídas</p>
          </div>
          <p className="text-3xl font-bold text-[#0A2540]">{trilhasFinalizadas.length}</p>
        </div>

        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 bg-purple-50 rounded-lg">
              <BookOpen className="w-5 h-5 text-purple-600" />
            </div>
            <p className="text-sm text-gray-600">Total de Trilhas</p>
          </div>
          <p className="text-3xl font-bold text-[#0A2540]">
            {trilhasEmAndamento.length + trilhasFinalizadas.length}
          </p>
        </div>
      </div>

      {/* Trilhas em Andamento */}
      <div className="mb-8">
        <h2 className="text-xl font-bold text-[#0A2540] mb-4">Trilhas em Andamento</h2>
        <div className="grid grid-cols-2 gap-6">
          {trilhasEmAndamento.map((trail) => (
            <div
              key={trail.id}
              onClick={() => navigate(`/app/trilha/${trail.id}`)}
              className="bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow cursor-pointer"
            >
              <div className={`h-40 bg-gradient-to-br ${trail.color} flex items-center justify-center`}>
                <BookOpen className="w-12 h-12 text-white" />
              </div>
              <div className="p-5">
                <h3 className="font-semibold text-[#0A2540] mb-4">{trail.name}</h3>
                <span className="inline-flex items-center gap-1 px-3 py-1 bg-blue-50 text-blue-700 rounded-full text-sm font-medium">
                  <Clock className="w-4 h-4" />
                  Em andamento
                </span>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Trilhas Finalizadas */}
      <div>
        <h2 className="text-xl font-bold text-[#0A2540] mb-4">Trilhas Finalizadas</h2>
        <div className="grid grid-cols-2 gap-6">
          {trilhasFinalizadas.map((trail) => (
            <div
              key={trail.id}
              className="bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow cursor-pointer"
            >
              <div className={`h-40 bg-gradient-to-br ${trail.color} flex items-center justify-center`}>
                <CheckCircle2 className="w-12 h-12 text-white" />
              </div>
              <div className="p-5">
                <h3 className="font-semibold text-[#0A2540] mb-4">{trail.name}</h3>
                <span className="inline-flex items-center gap-1 px-3 py-1 bg-green-50 text-green-700 rounded-full text-sm font-medium">
                  <CheckCircle2 className="w-4 h-4" />
                  Concluído
                </span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </FrontofficeLayout>
  );
}

export default MeuProgresso;
