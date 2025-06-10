import 'package:flutter/material.dart';
import 'package:todo_app/components/app_clock_painter.dart';
import 'package:todo_app/constants/app_color_path.dart';
import 'package:todo_app/constants/app_image_path.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/widgets/blue_circle_img_appbar_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Task> _tasks = [
    Task(title: 'Cook Rice and Chicken at 10 am', isCompleted: true),
    Task(title: 'Learn Reactjs at 12 pm', isCompleted: false),
    Task(title: 'Have Launch at 1pm', isCompleted: false),
    Task(title: 'Learn HTML and CSS at 3pm', isCompleted: false),
    Task(title: 'Have Dinner at 8pm', isCompleted: false),
  ];

  void _toggleTaskStatus(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hour = TimeOfDay.now().hour;
    String greeting;

    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternnon';
    } else {
      greeting = 'Good Evening';
    }
    return Scaffold(
      backgroundColor: AppColorPath.lightWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            _buildTopWidget(),
            const SizedBox(height: 20),
            _buildGreetingTextWidget(greeting),
            const SizedBox(height: 10),
            _buildOclockWidget(),
            const SizedBox(height: 10),
            _buildTasksListTextWidget(),
            const SizedBox(height: 15),
            _buildListTasksWidget(),
          ],
        ),
      ),
    );
  }

  Container _buildTopWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        color: AppColorPath.lightBlue,
      ),
      child: Stack(
        children: [
          const BlueCircleImgAppbarWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 120),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColorPath.darkBlue, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 56,
                    backgroundImage: AssetImage(AppImagePath.flutterLogoImg),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome Giao Su Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'PopPins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildGreetingTextWidget(String greeting) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          greeting,
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'PopPins',
            fontWeight: FontWeight.w600,
            color: AppColorPath.black,
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  Container _buildOclockWidget() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: CustomPaint(
        painter: ClockPainter(),
      ),
    );
  }

  Row _buildTasksListTextWidget() {
    return const Row(
      children: [
        SizedBox(width: 24),
        Text(
          'Tasks List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'PopPins',
          ),
        )
      ],
    );
  }

  Container _buildListTasksWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tasks List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'PopPins',
                ),
              ),
              Icon(
                Icons.add_circle,
                color: AppColorPath.lightBlue,
                size: 30,
              )
            ],
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _toggleTaskStatus(index),
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4),
                              color: _tasks[index].isCompleted
                                  ? AppColorPath.lightBlue
                                  : Colors.transparent,
                              border: Border.all(
                                color: _tasks[index].isCompleted
                                    ? AppColorPath.lightBlue
                                    : AppColorPath.black.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            _tasks[index].title,
                            style: TextStyle(
                              fontFamily: 'PopPins',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: _tasks[index].isCompleted
                                  ? AppColorPath.gray
                                  : Colors.black,
                              decoration: _tasks[index].isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
