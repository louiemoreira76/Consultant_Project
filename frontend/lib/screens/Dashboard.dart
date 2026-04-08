// lib/screens/dashboard.dart
import 'package:flutter/material.dart';
import '../widgets/Header.dart';
import '../widgets/Sidebar.dart';
import '../widgets/KPICard.dart';
import '../widgets/StudentTable.dart';
import '../widgets/TrailCard.dart';
import '../widgets/ChatWidget.dart';

// Mock data para o gráfico de engajamento (KPICard)
const List<ChartDataPoint> engagementData = [
  ChartDataPoint(value: 65),
  ChartDataPoint(value: 72),
  ChartDataPoint(value: 68),
  ChartDataPoint(value: 75),
  ChartDataPoint(value: 82),
  ChartDataPoint(value: 78),
  ChartDataPoint(value: 85),
];

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: Row(
        children: [
          // Sidebar fixa (largura 256 = w-64)
         SizedBox(
  width: 256,
  child: Sidebar(
    activeItem: 'Dashboard',
    onNavigate: (String route) {
      // TODO: implementar navegação entre telas
      debugPrint('Navegar para: $route');
    },
    onLogout: () {
      // TODO: implementar logout (ex: voltar para tela de login)
      debugPrint('Logout solicitado');
    },
  ),
),
          // Conteúdo principal (expande)
          Expanded(
            child: Column(
              children: [
                // Header
                const Header(),
                // Área rolável do conteúdo
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32), // p-8
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Linha de KPIs (4 cards)
                        GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 24, // gap-6
                          mainAxisSpacing: 24,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 1.2, // Ajuste conforme necessário
                          children: [
                            KPICard(
                              title: 'Total de Mentorados',
                              value: '247',
                              icon: Icons.people_outline,
                              trend: Trend.up,
                              trendValue: '+12% este mês',
                            ),
                            KPICard(
                              title: 'Taxa de Engajamento',
                              value: '85%',
                              icon: Icons.trending_up,
                              trend: Trend.up,
                              trendValue: '+5.2%',
                              showChart: true,
                              chartData: engagementData,
                            ),
                            KPICard(
                              title: 'Aulas Assistidas (Hoje)',
                              value: '142',
                              icon: Icons.play_arrow_outlined,
                              trend: Trend.up,
                              trendValue: '+18',
                            ),
                            KPICard(
                              title: 'Dúvidas Pendentes',
                              value: '8',
                              icon: Icons.message_outlined,
                              alert: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 32), // mb-8

                        // Linha com StudentTable (2/3) e TrailCards (1/3)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // StudentTable - ocupa 2/3 da largura
                            const Expanded(
                              flex: 2,
                              child: StudentTable(),
                            ),
                            const SizedBox(width: 24), // gap-6
                            // TrailCards - ocupa 1/3 da largura
                            const Expanded(
                              flex: 1,
                              child: TrailCards(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32), // mb-8

                        // ChatWidget com largura máxima limitada (max-w-2xl ≈ 672px)
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 672),
                          child: const ChatWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}