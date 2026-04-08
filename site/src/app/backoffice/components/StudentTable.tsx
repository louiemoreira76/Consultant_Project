import { MoreVertical } from 'lucide-react';

interface Student {
  id: number;
  name: string;
  avatar: string;
  company: string;
  lastAccess: string;
  progress: number;
  status: 'Ativo' | 'Alerta' | 'Inativo';
}

const mockStudents: Student[] = [
  {
    id: 1,
    name: 'Carlos Silva',
    avatar: 'CS',
    company: 'Silva & Associados',
    lastAccess: 'Há 2 horas',
    progress: 85,
    status: 'Ativo',
  },
  {
    id: 2,
    name: 'Ana Rodrigues',
    avatar: 'AR',
    company: 'Contabilidade RJ',
    lastAccess: 'Há 1 dia',
    progress: 92,
    status: 'Ativo',
  },
  {
    id: 3,
    name: 'Pedro Santos',
    avatar: 'PS',
    company: 'Santos Consultoria',
    lastAccess: 'Há 3 dias',
    progress: 45,
    status: 'Alerta',
  },
  {
    id: 4,
    name: 'Mariana Costa',
    avatar: 'MC',
    company: 'Tax Solutions SP',
    lastAccess: 'Há 5 horas',
    progress: 78,
    status: 'Ativo',
  },
  {
    id: 5,
    name: 'Roberto Lima',
    avatar: 'RL',
    company: 'Lima Contadores',
    lastAccess: 'Há 7 dias',
    progress: 22,
    status: 'Inativo',
  },
  {
    id: 6,
    name: 'Juliana Mendes',
    avatar: 'JM',
    company: 'Mendes & Cia',
    lastAccess: 'Há 4 horas',
    progress: 95,
    status: 'Ativo',
  },
];

export function StudentTable() {
  const getStatusColor = (status: Student['status']) => {
    switch (status) {
      case 'Ativo':
        return 'bg-green-100 text-green-700';
      case 'Alerta':
        return 'bg-yellow-100 text-yellow-700';
      case 'Inativo':
        return 'bg-red-100 text-red-700';
    }
  };

  return (
    <div className="bg-white rounded-xl shadow-sm border border-gray-100">
      <div className="px-6 py-4 border-b border-gray-100">
        <h2 className="text-lg font-semibold text-[#0A2540]">
          Monitoramento de Alunos
        </h2>
      </div>
      
      <div className="overflow-x-auto">
        <table className="w-full">
          <thead>
            <tr className="border-b border-gray-100 bg-gray-50">
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-600 uppercase tracking-wider">
                Aluno
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-600 uppercase tracking-wider">
                Empresa
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-600 uppercase tracking-wider">
                Último Acesso
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-600 uppercase tracking-wider">
                Progresso
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-600 uppercase tracking-wider">
                Status
              </th>
              <th className="text-left px-6 py-3 text-xs font-medium text-gray-600 uppercase tracking-wider">
                
              </th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100">
            {mockStudents.map((student) => (
              <tr key={student.id} className="hover:bg-gray-50 transition-colors">
                <td className="px-6 py-4 whitespace-nowrap">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-full bg-[#0A2540] text-white flex items-center justify-center font-medium">
                      {student.avatar}
                    </div>
                    <span className="font-medium text-gray-900">{student.name}</span>
                  </div>
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                  {student.company}
                </td>
                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                  {student.lastAccess}
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <div className="flex items-center gap-3">
                    <div className="flex-1 bg-gray-200 rounded-full h-2 max-w-[120px]">
                      <div
                        className="bg-[#0A2540] h-2 rounded-full transition-all"
                        style={{ width: `${student.progress}%` }}
                      />
                    </div>
                    <span className="text-sm font-medium text-gray-700 min-w-[40px]">
                      {student.progress}%
                    </span>
                  </div>
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <span className={`px-3 py-1 rounded-full text-xs font-medium ${getStatusColor(student.status)}`}>
                    {student.status}
                  </span>
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <button className="text-gray-400 hover:text-gray-600 transition-colors">
                    <MoreVertical className="w-5 h-5" />
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
