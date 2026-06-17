// Scaffold(
// body: SafeArea(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const SizedBox(height: 16),
//
// // 🔹 Title
// const Text(
// "History",
// style: TextStyle(
// fontSize: 24,
// fontWeight: FontWeight.bold,
// color: ColorManager.textColor,
// ),
// ),
//
// const SizedBox(height: 4),
//
// const Text(
// "View all your past summaries",
// style: TextStyle(
// color: ColorManager.textSecondary,
// ),
// ),
//
// const SizedBox(height: 20),
//
// // 🔹 Search
// SearchField(),
//
// const SizedBox(height: 16),
//
// // 🔹 Filters
// FilterRow(),
//
// const SizedBox(height: 16),
//
// // 🔹 Languages
// LanguageRow(),
//
// const SizedBox(height: 20),
//
// // 🔹 List
// Expanded(
// child: BlocBuilder<HistoryCubit, HistoryState>(
// builder: (context, state) {
// if (state is HistoryInitial) {
// return const Center(
// child: CircularProgressIndicator());
// }
//
// if (state is HistoryLoaded) {
// final items = state.items;
//
// if (items.isEmpty) {
// return const Center(
// child: Text("No history yet"));
// }
//
// return ListView.builder(
// itemCount: items.length,
// itemBuilder: (context, index) {
// return HistoryCard(item: items[index]);
// },
// );
// }
//
// return const SizedBox();
// },
// ),
// ),
// ],
// ),
// ),
// ),
// ),