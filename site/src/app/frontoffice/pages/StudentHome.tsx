import { FrontofficeLayout } from '../components/FrontofficeLayout';
import { Play, BookOpen, Clock, TrendingUp } from 'lucide-react';

function StudentHome() {
  return (
    <FrontofficeLayout activeItem="Início">
      {/* Welcome Section */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-[#0A2540] mb-2">
          Bem-vindo de volta, Italo! 👋
        </h1>
        <p className="text-gray-600">Continue de onde parou e alcance seus objetivos</p>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-4 gap-6 mb-8">
        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 bg-blue-50 rounded-lg">
              <BookOpen className="w-5 h-5 text-blue-600" />
            </div>
            <p className="text-sm text-gray-600">Trilhas Ativas</p>
          </div>
          <p className="text-3xl font-bold text-[#0A2540]">3</p>
        </div>

        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 bg-green-50 rounded-lg">
              <Play className="w-5 h-5 text-green-600" />
            </div>
            <p className="text-sm text-gray-600">Aulas Concluídas</p>
          </div>
          <p className="text-3xl font-bold text-[#0A2540]">24</p>
        </div>

        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 bg-amber-50 rounded-lg">
              <Clock className="w-5 h-5 text-amber-600" />
            </div>
            <p className="text-sm text-gray-600">Horas Assistidas</p>
          </div>
          <p className="text-3xl font-bold text-[#0A2540]">18h</p>
        </div>

        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 bg-purple-50 rounded-lg">
              <TrendingUp className="w-5 h-5 text-purple-600" />
            </div>
            <p className="text-sm text-gray-600">Progresso Médio</p>
          </div>
          <p className="text-3xl font-bold text-[#0A2540]">68%</p>
        </div>
      </div>

      {/* Continue Watching */}
      <div className="mb-8">
        <h2 className="text-xl font-bold text-[#0A2540] mb-4">Continuar Assistindo</h2>
        <div className="bg-white rounded-xl p-6 border border-gray-200">
          <div className="flex items-center gap-6">
            <div className="w-48 h-28 bg-gradient-to-br from-blue-500 to-blue-700 rounded-lg flex items-center justify-center">
              <Play className="w-12 h-12 text-white" />
            </div>
            <div className="flex-1">
              <h3 className="text-lg font-semibold text-[#0A2540] mb-1">
                Aula 03 - Cálculo de Recuperação
              </h3>
              <p className="text-gray-600 mb-3">Recuperação de Créditos Tributários</p>
              <div className="flex items-center gap-4">
                <div className="flex-1">
                  <div className="h-2 bg-gray-200 rounded-full overflow-hidden">
                    <div className="h-full bg-[#0A2540]" style={{ width: '45%' }}></div>
                  </div>
                </div>
                <span className="text-sm text-gray-600">45% completo</span>
              </div>
            </div>
            <button className="px-6 py-3 bg-[#D4AF37] text-white rounded-lg hover:bg-[#C49F2F] transition-all font-medium">
              Continuar
            </button>
          </div>
        </div>
      </div>

      {/* My Trails */}
      <div>
        <h2 className="text-xl font-bold text-[#0A2540] mb-4">Minhas Trilhas</h2>
        <div className="grid grid-cols-3 gap-6">
          {[
            {
              name: 'Recuperação de Créditos Tributários',
              progress: 68,
              lessons: 8,
              completed: 5,
              color: 'from-blue-500 to-blue-700'
            },
            {
              name: 'Planejamento Societário',
              progress: 40,
              lessons: 5,
              completed: 2,
              color: 'from-purple-500 to-purple-700'
            },
            {
              name: 'ICMS-ST e Substituição Tributária',
              progress: 25,
              lessons: 6,
              completed: 1,
              color: 'from-green-500 to-green-700'
            },
          ].map((trail, index) => (
            <div key={index} className="bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow cursor-pointer">
              <div className={`h-32 bg-gradient-to-br ${trail.color} flex items-center justify-center`}>
                <BookOpen className="w-12 h-12 text-white" />
              </div>
              <div className="p-5">
                <h3 className="font-semibold text-[#0A2540] mb-2">{trail.name}</h3>
                <p className="text-sm text-gray-600 mb-3">
                  {trail.completed} de {trail.lessons} aulas concluídas
                </p>
                <div className="mb-2">
                  <div className="h-2 bg-gray-200 rounded-full overflow-hidden">
                    <div className="h-full bg-[#0A2540]" style={{ width: `${trail.progress}%` }}></div>
                  </div>
                </div>
                <p className="text-xs text-gray-500">{trail.progress}% completo</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </FrontofficeLayout>
  );
}

export default StudentHome;
