import { MessageSquare, Send } from 'lucide-react';

interface ChatMessage {
  id: number;
  studentName: string;
  studentAvatar: string;
  message: string;
  time: string;
  unread: boolean;
}

const mockMessages: ChatMessage[] = [
  {
    id: 1,
    studentName: 'Carlos Silva',
    studentAvatar: 'CS',
    message: 'Professora, tenho uma dúvida sobre o cálculo de PIS/COFINS no regime...',
    time: 'Há 10 min',
    unread: true,
  },
  {
    id: 2,
    studentName: 'Ana Rodrigues',
    studentAvatar: 'AR',
    message: 'Como faço para aplicar a recuperação de créditos em empresas do...',
    time: 'Há 1 hora',
    unread: true,
  },
  {
    id: 3,
    studentName: 'Mariana Costa',
    studentAvatar: 'MC',
    message: 'Obrigada pela explicação sobre ICMS-ST! Ficou muito claro agora.',
    time: 'Há 2 horas',
    unread: false,
  },
];

export function ChatWidget() {
  return (
    <div className="bg-white rounded-xl shadow-sm border border-gray-100">
      <div className="px-6 py-4 border-b border-gray-100 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <MessageSquare className="w-5 h-5 text-[#0A2540]" />
          <h2 className="text-lg font-semibold text-[#0A2540]">
            Últimas Mensagens
          </h2>
        </div>
        <span className="px-2 py-1 bg-red-100 text-red-600 text-xs font-medium rounded-full">
          {mockMessages.filter(m => m.unread).length} novas
        </span>
      </div>

      <div className="divide-y divide-gray-100">
        {mockMessages.map((msg) => (
          <div
            key={msg.id}
            className={`px-6 py-4 hover:bg-gray-50 transition-colors cursor-pointer ${
              msg.unread ? 'bg-blue-50/30' : ''
            }`}
          >
            <div className="flex items-start gap-3">
              <div className="w-10 h-10 rounded-full bg-[#0A2540] text-white flex items-center justify-center font-medium flex-shrink-0">
                {msg.studentAvatar}
              </div>
              <div className="flex-1 min-w-0">
                <div className="flex items-center justify-between mb-1">
                  <p className="font-medium text-sm text-gray-900">
                    {msg.studentName}
                  </p>
                  <span className="text-xs text-gray-500">{msg.time}</span>
                </div>
                <p className="text-sm text-gray-600 truncate">
                  {msg.message}
                </p>
                {msg.unread && (
                  <button className="mt-2 flex items-center gap-1.5 text-xs text-[#D4AF37] hover:text-[#C19D2F] font-medium transition-colors">
                    <Send className="w-3 h-3" />
                    Responder
                  </button>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="px-6 py-3 border-t border-gray-100">
        <button className="text-sm text-[#0A2540] hover:text-[#164067] font-medium transition-colors">
          Ver todas as mensagens →
        </button>
      </div>
    </div>
  );
}
