import { useNavigate } from 'react-router-dom';
import { Shield, GraduationCap } from 'lucide-react';

function SelectPortal() {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen bg-gradient-to-br from-[#0A2540] via-[#164067] to-[#0A2540] flex items-center justify-center font-[Inter,sans-serif] p-8">
      <div className="max-w-5xl w-full">
        {/* Logo */}
        <div className="text-center mb-12">
          <h1 className="text-5xl font-bold text-white mb-3">
            LT <span className="text-[#D4AF37]">Tax</span>
          </h1>
          <p className="text-white/70 text-lg">Plataforma de Mentoria Premium</p>
        </div>

        {/* Portal Selection */}
        <div className="grid md:grid-cols-2 gap-8">
          {/* Admin Portal */}
          <button
            onClick={() => navigate('/admin/dashboard')}
            className="group bg-white rounded-2xl p-8 hover:shadow-2xl transition-all hover:-translate-y-1"
          >
            <div className="flex flex-col items-center text-center">
              <div className="w-20 h-20 bg-[#0A2540] rounded-2xl flex items-center justify-center mb-6 group-hover:bg-[#D4AF37] transition-colors">
                <Shield className="w-10 h-10 text-white" />
              </div>
              <h2 className="text-2xl font-bold text-[#0A2540] mb-3">
                Área Administrativa
              </h2>
              <p className="text-gray-600 mb-6">
                Gerencie trilhas, monitore alunos e acesse relatórios completos
              </p>
              <div className="flex items-center gap-2 text-[#0A2540] font-medium group-hover:text-[#D4AF37] transition-colors">
                <span>Acessar Backoffice</span>
                <span className="group-hover:translate-x-1 transition-transform">→</span>
              </div>
            </div>
          </button>

          {/* Student Portal */}
          <button
            onClick={() => navigate('/app/home')}
            className="group bg-white rounded-2xl p-8 hover:shadow-2xl transition-all hover:-translate-y-1"
          >
            <div className="flex flex-col items-center text-center">
              <div className="w-20 h-20 bg-gradient-to-br from-blue-500 to-blue-700 rounded-2xl flex items-center justify-center mb-6 group-hover:from-[#D4AF37] group-hover:to-[#C49F2F] transition-all">
                <GraduationCap className="w-10 h-10 text-white" />
              </div>
              <h2 className="text-2xl font-bold text-[#0A2540] mb-3">
                Portal do Aluno
              </h2>
              <p className="text-gray-600 mb-6">
                Acesse suas trilhas, assista aulas e acompanhe seu progresso
              </p>
              <div className="flex items-center gap-2 text-[#0A2540] font-medium group-hover:text-[#D4AF37] transition-colors">
                <span>Acessar Frontoffice</span>
                <span className="group-hover:translate-x-1 transition-transform">→</span>
              </div>
            </div>
          </button>
        </div>

        {/* Footer */}
        <div className="text-center mt-12">
          <p className="text-white/50 text-sm">
            © 2026 LT Tax - Mentoria Tributária de Elite
          </p>
        </div>
      </div>
    </div>
  );
}

export default SelectPortal;
