import { FrontofficeLayout } from '../components/FrontofficeLayout';
import { Play, BookOpen, Clock, TrendingUp } from 'lucide-react';
import { useNavigate } from 'react-router';
import { ImageWithFallback } from '../../components/figma/ImageWithFallback';

function StudentHome() {
  const navigate = useNavigate();

  return (
    <FrontofficeLayout activeItem="Início">
      {/* Hero Banner Section - Full Width */}
      <div className="mb-8 -mt-8 -mx-8">
        <div className="relative h-80 overflow-hidden">
          <ImageWithFallback
            src="https://images.unsplash.com/photo-1770364022652-f3af53a889d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwyfHxjb25maWRlbnQlMjBzbWlsaW5nJTIwd29tYW4lMjBhcm1zJTIwY3Jvc3NlZCUyMHByb2Zlc3Npb25hbHxlbnwxfHx8fDE3NzU2NzE4MDN8MA&ixlib=rb-4.1.0&q=80&w=1080"
            alt="Confident professional"
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 bg-gradient-to-r from-[#0A2540]/85 to-transparent flex items-center">
            <div className="px-12 max-w-7xl mx-auto w-full">
              <h1 className="text-5xl font-bold text-white mb-4">
                Bem-vindo de volta, Italo!
              </h1>
              <p className="text-gray-100 text-xl">Continue sua jornada de aprendizado e alcance seus objetivos</p>
            </div>
          </div>
        </div>
      </div>

      {/* Continuar Trilha Section */}
      <div className="mb-8">
        <h2 className="text-xl font-bold text-[#0A2540] mb-4">Continuar Trilha</h2>
        <div className="space-y-4">
          {/* Course Card 1 */}
          <div className="bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow">
            <div className="flex items-center gap-6 p-6">
              {/* Course Image */}
              <div className="w-48 h-32 bg-gradient-to-br from-blue-500 to-blue-700 rounded-lg flex items-center justify-center flex-shrink-0">
                <Play className="w-12 h-12 text-white" />
              </div>

              {/* Course Info */}
              <div className="flex-1">
                <p className="text-sm text-gray-500 mb-1">Aula 03 - Cálculo de Recuperação</p>
                <h3 className="text-lg font-semibold text-[#0A2540] mb-4">
                  Recuperação de Créditos Tributários
                </h3>
                <span className="inline-block px-3 py-1 bg-blue-50 text-blue-700 rounded-full text-sm font-medium">
                  Em andamento
                </span>
              </div>

              {/* Continue Button */}
              <button
                onClick={() => navigate('/app/trilha/1')}
                className="px-6 py-3 bg-[#0A2540] text-white rounded-lg hover:bg-[#1a3a5f] transition-all font-medium flex-shrink-0"
              >
                Continuar
              </button>
            </div>
          </div>

          {/* Course Card 2 */}
          <div className="bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow">
            <div className="flex items-center gap-6 p-6">
              {/* Course Image */}
              <div className="w-48 h-32 bg-gradient-to-br from-purple-500 to-purple-700 rounded-lg flex items-center justify-center flex-shrink-0">
                <Play className="w-12 h-12 text-white" />
              </div>

              {/* Course Info */}
              <div className="flex-1">
                <p className="text-sm text-gray-500 mb-1">Aula 04 - Cálculo de Recuperação</p>
                <h3 className="text-lg font-semibold text-[#0A2540] mb-4">
                  Recuperação de Créditos Tributários
                </h3>
                <span className="inline-block px-3 py-1 bg-blue-50 text-blue-700 rounded-full text-sm font-medium">
                  Em andamento
                </span>
              </div>

              {/* Continue Button */}
              <button
                onClick={() => navigate('/app/trilha/2')}
                className="px-6 py-3 bg-[#0A2540] text-white rounded-lg hover:bg-[#1a3a5f] transition-all font-medium flex-shrink-0"
              >
                Continuar
              </button>
            </div>
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
              color: 'from-blue-500 to-blue-700',
              status: 'Em andamento'
            },
            {
              name: 'Planejamento Societário',
              color: 'from-purple-500 to-purple-700',
              status: 'Em andamento'
            },
            {
              name: 'ICMS-ST e Substituição Tributária',
              color: 'from-green-500 to-green-700',
              status: 'Em andamento'
            },
          ].map((trail, index) => (
            <div
              key={index}
              onClick={() => navigate(`/app/trilha/${index + 1}`)}
              className="bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow cursor-pointer"
            >
              <div className={`h-40 bg-gradient-to-br ${trail.color} flex items-center justify-center`}>
                <BookOpen className="w-12 h-12 text-white" />
              </div>
              <div className="p-5">
                <h3 className="font-semibold text-[#0A2540] mb-4">{trail.name}</h3>
                <span className="inline-block px-3 py-1 bg-blue-50 text-blue-700 rounded-full text-sm font-medium">
                  {trail.status}
                </span>
              </div>
            </div>
          ))}
        </div>
      </div>
    </FrontofficeLayout>
  );
}

export default StudentHome;
