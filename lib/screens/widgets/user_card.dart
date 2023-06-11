import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/bloc/auth_bloc.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(18),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Authenticated) {
              final user = state.user;

              return Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    foregroundImage: NetworkImage(
                      'https://api.dicebear.com/6.x/lorelei/png?seed=${user.uid}',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Вошел как:',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user.email!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              );
            } else {
              return const Text('Not logged in');
            }
          },
        ),
      ),
    );
  }
}
