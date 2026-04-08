import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1), // border-gray-200
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // px-8 py-4
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          const Text(
            'Gestão Estratégica de Mentorados',
            style: TextStyle(
              fontSize: 24, // text-2xl
              fontWeight: FontWeight.w600, // font-semibold
              color: Color(0xFF0A2540), // text-[#0A2540]
            ),
          ),

          // Actions (Search, Bell, Button)
          Row(
            children: [
              // Search Bar
              SizedBox(
                width: 320, // w-80
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 16,
                      color: Color(0xFF9CA3AF), // text-gray-400
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB), // bg-gray-50
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // rounded-lg
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFF0A2540),
                        width: 2,
                      ),
                    ),
                    isDense: true,
                  ),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 16), // gap-4

              // Notification Bell with indicator
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 20,
                      color: Color(0xFF4B5563), // text-gray-600
                    ),
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16), // gap-4

              // Primary Action Button
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 20),
                label: const Text('Novo Conteúdo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4AF37), // bg-[#D4AF37]
                  foregroundColor: const Color(0xFF0A2540), // text-[#0A2540]
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20, // px-5
                    vertical: 10, // py-2.5
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // rounded-lg
                  ),
                  elevation: 1,
                  shadowColor: Colors.black12,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500, // font-medium
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(96); // Ajuste conforme padding + conteúdo
}