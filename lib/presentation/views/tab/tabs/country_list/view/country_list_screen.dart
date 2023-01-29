import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contest/data/models/status.dart';
import 'package:flutter_contest/data/repos/country/country_repo.dart';
import 'package:flutter_contest/data/services/api/api_client.dart';
import 'package:flutter_contest/data/services/api/api_service.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_contest/presentation/utils/utils.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/country_list/cubit/country_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryCubit(
        CountryRepo(
          apiService: ApiService(
            ApiClient(),
          ),
        ),
      )..getCountries(),
      child: Scaffold(
        backgroundColor: ColorConst.white,
        appBar: AppBar(title: const Text("API call and Caching")),
        body: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            if (state.status == Status.success) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
                children: List.generate(
                  state.countries.length,
                  (index) {
                    var country = state.countries[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.countryDetail,
                          arguments: country,
                        );
                      },
                      title: Text(country.name),
                      subtitle: Text(country.capital),
                    );
                  },
                ),
              );
            } else if (state.status == Status.loading) {
              return Utils.showLoader();
            } else if (state.status == Status.failure) {
              return Center(
                child: Text(state.errorText),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
