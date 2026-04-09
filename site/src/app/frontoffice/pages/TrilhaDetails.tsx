import { FrontofficeLayout } from '../components/FrontofficeLayout';
import { FileText, Send, Info, Play } from 'lucide-react';
import { useState } from 'react';
import { useParams, useNavigate } from 'react-router';

function TrilhaDetails() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [questionType, setQuestionType] = useState<'publico' | 'privado'>('publico');
  const [question, setQuestion] = useState('');

  const handleFinish = () => {
    navigate('/app/home');
  };

  const handleSubmitQuestion = () => {
    // Handle question submission
    setQuestion('');
  };

  return (
    <FrontofficeLayout activeItem="Minhas Trilhas">
      <div className="max-w-4xl mx-auto">
        {/* Lesson Title */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-[#0A2540] mb-2">
            Aula 03 - Cálculo de Recuperação
          </h1>
          <p className="text-gray-600">Recuperação de Créditos Tributários</p>
        </div>

        {/* Material da Aula Section */}
        <div className="bg-white rounded-xl border border-gray-200 p-6 mb-8">
          <h2 className="text-lg font-semibold text-[#0A2540] mb-4">Material da Aula</h2>

          {/* Video Player */}
          <div className="mb-6">
            <div className="relative w-full aspect-video bg-gray-900 rounded-lg overflow-hidden">
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="text-center">
                  <Play className="w-20 h-20 text-white/80 mx-auto mb-3" />
                  <p className="text-white/60 text-sm">Vídeo da Aula 03</p>
                </div>
              </div>
            </div>
          </div>

          {/* PDF Link */}
          <a
            href="#"
            className="flex items-center gap-3 p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors border border-gray-200"
          >
            <div className="p-3 bg-red-50 rounded-lg">
              <FileText className="w-6 h-6 text-red-600" />
            </div>
            <div className="flex-1">
              <p className="font-medium text-[#0A2540]">Apostila - Cálculo de Recuperação.pdf</p>
              <p className="text-sm text-gray-500">2.3 MB</p>
            </div>
            <span className="text-sm text-[#0A2540] font-medium">Visualizar</span>
          </a>
        </div>

        {/* Questions Section */}
        <div className="bg-white rounded-xl border border-gray-200 p-6 mb-8">
          <h2 className="text-lg font-semibold text-[#0A2540] mb-4">Dúvidas</h2>

          {/* Public/Private Toggle */}
          <div className="flex gap-3 mb-4">
            <button
              onClick={() => setQuestionType('publico')}
              className={`relative flex-1 px-4 py-3 rounded-lg border-2 transition-all group ${
                questionType === 'publico'
                  ? 'border-[#0A2540] bg-[#0A2540]/5'
                  : 'border-gray-200 hover:border-gray-300'
              }`}
            >
              <div className="flex items-center justify-center gap-2">
                <div
                  className={`w-4 h-4 rounded-full border-2 flex items-center justify-center ${
                    questionType === 'publico' ? 'border-[#0A2540]' : 'border-gray-300'
                  }`}
                >
                  {questionType === 'publico' && (
                    <div className="w-2 h-2 rounded-full bg-[#0A2540]"></div>
                  )}
                </div>
                <span
                  className={`font-medium ${
                    questionType === 'publico' ? 'text-[#0A2540]' : 'text-gray-600'
                  }`}
                >
                  Público
                </span>
                <Info className="w-4 h-4 text-gray-400" />
              </div>
              {/* Tooltip */}
              <div className="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-900 text-white text-xs rounded-lg opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none whitespace-nowrap">
                Sua mensagem será exibida para todos
              </div>
            </button>

            <button
              onClick={() => setQuestionType('privado')}
              className={`relative flex-1 px-4 py-3 rounded-lg border-2 transition-all group ${
                questionType === 'privado'
                  ? 'border-[#0A2540] bg-[#0A2540]/5'
                  : 'border-gray-200 hover:border-gray-300'
              }`}
            >
              <div className="flex items-center justify-center gap-2">
                <div
                  className={`w-4 h-4 rounded-full border-2 flex items-center justify-center ${
                    questionType === 'privado' ? 'border-[#0A2540]' : 'border-gray-300'
                  }`}
                >
                  {questionType === 'privado' && (
                    <div className="w-2 h-2 rounded-full bg-[#0A2540]"></div>
                  )}
                </div>
                <span
                  className={`font-medium ${
                    questionType === 'privado' ? 'text-[#0A2540]' : 'text-gray-600'
                  }`}
                >
                  Privado
                </span>
                <Info className="w-4 h-4 text-gray-400" />
              </div>
              {/* Tooltip */}
              <div className="absolute bottom-full left-1/2 transform -translate-x-1/2 mb-2 px-3 py-2 bg-gray-900 text-white text-xs rounded-lg opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none whitespace-nowrap">
                Sua mensagem será exibida apenas para os administradores
              </div>
            </button>
          </div>

          {/* Question Input */}
          <div className="relative">
            <textarea
              value={question}
              onChange={(e) => setQuestion(e.target.value)}
              placeholder="Digite sua dúvida aqui..."
              rows={4}
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#0A2540]/20 focus:border-[#0A2540] resize-none"
            />
            <button
              onClick={handleSubmitQuestion}
              className="absolute bottom-3 right-3 px-4 py-2 bg-[#0A2540] text-white rounded-lg hover:bg-[#1a3a5f] transition-all font-medium flex items-center gap-2"
            >
              <Send className="w-4 h-4" />
              Enviar
            </button>
          </div>
        </div>

        {/* Finish Button */}
        <div className="flex justify-start">
          <button
            onClick={handleFinish}
            className="px-8 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-all font-medium"
          >
            Finalizar
          </button>
        </div>
      </div>
    </FrontofficeLayout>
  );
}

export default TrilhaDetails;
