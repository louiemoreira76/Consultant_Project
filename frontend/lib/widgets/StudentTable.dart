import 'package:flutter/material.dart';

// Modelo de dados
class Student {
  final int id;
  final String name;
  final String avatar;
  final String company;
  final String lastAccess;
  final int progress;
  final String status; // 'Ativo', 'Alerta', 'Inativo'

  const Student({
    required this.id,
    required this.name,
    required this.avatar,
    required this.company,
    required this.lastAccess,
    required this.progress,
    required this.status,
  });
}

// Mock de dados
const List<Student> mockStudents = [
  Student(
    id: 1,
    name: 'Carlos Silva',
    avatar: 'CS',
    company: 'Silva & Associados',
    lastAccess: 'Há 2 horas',
    progress: 85,
    status: 'Ativo',
  ),
  Student(
    id: 2,
    name: 'Ana Rodrigues',
    avatar: 'AR',
    company: 'Contabilidade RJ',
    lastAccess: 'Há 1 dia',
    progress: 92,
    status: 'Ativo',
  ),
  Student(
    id: 3,
    name: 'Pedro Santos',
    avatar: 'PS',
    company: 'Santos Consultoria',
    lastAccess: 'Há 3 dias',
    progress: 45,
    status: 'Alerta',
  ),
  Student(
    id: 4,
    name: 'Mariana Costa',
    avatar: 'MC',
    company: 'Tax Solutions SP',
    lastAccess: 'Há 5 horas',
    progress: 78,
    status: 'Ativo',
  ),
  Student(
    id: 5,
    name: 'Roberto Lima',
    avatar: 'RL',
    company: 'Lima Contadores',
    lastAccess: 'Há 7 dias',
    progress: 22,
    status: 'Inativo',
  ),
  Student(
    id: 6,
    name: 'Juliana Mendes',
    avatar: 'JM',
    company: 'Mendes & Cia',
    lastAccess: 'Há 4 horas',
    progress: 95,
    status: 'Ativo',
  ),
];

class StudentTable extends StatelessWidget {
  const StudentTable({super.key});

  // Obtém cores do status (estilo Tailwind adaptado)
  Color _getStatusBgColor(String status) {
    switch (status) {
      case 'Ativo':
        return Colors.green.shade100;
      case 'Alerta':
        return Colors.yellow.shade100;
      case 'Inativo':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case 'Ativo':
        return Colors.green.shade700;
      case 'Alerta':
        return Colors.yellow.shade800;
      case 'Inativo':
        return Colors.red.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho com título
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
            child: Text(
              'Monitoramento de Alunos',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0A2540),
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          // Tabela rolável horizontalmente
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              // Largura mínima para evitar quebras em telas pequenas
              child: Column(
                children: [
                  // Cabeçalho da tabela
                  Container(
                    color: Colors.grey.shade50,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: const Row(
                      children: [
                        Expanded(flex: 2, child: _TableHeaderCell('Aluno')),
                        Expanded(flex: 2, child: _TableHeaderCell('Empresa')),
                        Expanded(flex: 1, child: _TableHeaderCell('Último Acesso')),
                        Expanded(flex: 2, child: _TableHeaderCell('Progresso')),
                        Expanded(flex: 1, child: _TableHeaderCell('Status')),
                        SizedBox(width: 48), // Espaço para o botão de ações
                      ],
                    ),
                  ),
                  // Linhas da tabela
                  ...mockStudents.map((student) => _StudentRow(student: student)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para célula de cabeçalho
class _TableHeaderCell extends StatelessWidget {
  final String text;
  const _TableHeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF4B5563),
        letterSpacing: 0.5,
      ),
    );
  }
}

// Widget para uma linha da tabela
class _StudentRow extends StatelessWidget {
  final Student student;

  const _StudentRow({required this.student});

  @override
  Widget build(BuildContext context) {
    final statusBgColor = StudentTable()._getStatusBgColor(student.status);
    final statusTextColor = StudentTable()._getStatusTextColor(student.status);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF3F4F6)),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Ação ao clicar na linha (opcional)
          },
          hoverColor: Colors.grey.shade50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                // Coluna Aluno (com avatar)
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      // Avatar circular
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0A2540),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            student.avatar,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        student.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                ),
                // Coluna Empresa
                Expanded(
                  flex: 2,
                  child: Text(
                    student.company,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ),
                // Coluna Último Acesso
                Expanded(
                  flex: 1,
                  child: Text(
                    student.lastAccess,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ),
                // Coluna Progresso (barra + %)
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: student.progress / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0A2540),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 40,
                        child: Text(
                          '${student.progress}%',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF374151),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Coluna Status (badge)
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      student.status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: statusTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Botão de ações (MoreVertical)
                SizedBox(
                  width: 48,
                  child: IconButton(
                    icon: const Icon(Icons.more_vert, size: 20),
                    color: Colors.grey.shade400,
                    onPressed: () {
                      // Ação do menu (exibir bottom sheet, etc.)
                    },
                    splashRadius: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}