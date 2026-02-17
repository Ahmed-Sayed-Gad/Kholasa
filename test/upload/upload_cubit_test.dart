// import 'package:flutter_test/flutter_test.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:mocktail/mocktail.dart';
//
// import 'package:project_one_c3_team/lib/presentation/upload/cubit/upload_cubit.dart';
// import 'package:project_one_c3_team/lib/presentation/upload/cubit/upload_state.dart';
// import 'package:project_one_c3_team/lib/domain/upload/usecases/pick_and_validate_file_usecase.dart';
// import 'package:project_one_c3_team/lib/domain/upload/entities/upload_file.dart';
//
// class MockPickAndValidateFileUseCase extends Mock
//     implements PickAndValidateFileUseCase {}
//
// void main() {
//   late UploadCubit cubit;
//   late MockPickAndValidateFileUseCase useCase;
//
//   setUp(() {
//     useCase = MockPickAndValidateFileUseCase();
//     cubit = UploadCubit(useCase);
//   });
//
//   tearDown(() {
//     cubit.close();
//   });
//
//   test('initial state is UploadIdle', () {
//     expect(cubit.state, isA<UploadIdle>());
//   });
//
//   blocTest<UploadCubit, UploadState>(
//     'emits [UploadPicking, UploadReady] when file is valid',
//     build: () {
//       when(() => useCase.execute()).thenAnswer(
//             (_) async => UploadFile(
//           name: 'test.pdf',
//           sizeInBytes: 1000,
//           extension: 'pdf',
//           isValid: true,
//         ),
//       );
//
//       return cubit;
//     },
//     act: (cubit) => cubit.pickFile(),
//     expect: () => [
//       isA<UploadPicking>(),
//       isA<UploadReady>(),
//     ],
//   );
//
//   blocTest<UploadCubit, UploadState>(
//     'emits [UploadPicking, UploadFailure] when file is invalid',
//     build: () {
//       when(() => useCase.execute()).thenAnswer(
//             (_) async => UploadFile(
//           name: 'bad.exe',
//           sizeInBytes: 1000,
//           extension: 'exe',
//           isValid: false,
//           errorMessage: 'Invalid file',
//         ),
//       );
//
//       return cubit;
//     },
//     act: (cubit) => cubit.pickFile(),
//     expect: () => [
//       isA<UploadPicking>(),
//       isA<UploadFailure>(),
//     ],
//   );
//
//   blocTest<UploadCubit, UploadState>(
//     'uploadFake emits progress then success',
//     build: () => cubit,
//     act: (cubit) => cubit.uploadFake(),
//     expect: () => [
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadUploading>(),
//       isA<UploadSuccess>(),
//     ],
//   );
//
//   blocTest<UploadCubit, UploadState>(
//     'reset emits UploadIdle',
//     build: () => cubit,
//     act: (cubit) => cubit.reset(),
//     expect: () => [
//       isA<UploadIdle>(),
//     ],
//   );
// }