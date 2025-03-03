import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../utils/exports.dart';
import 'bottom_navigation_bar_ui.dart';
class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leadingWidth: Get.width * 0.17,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.black,
        elevation: 3,
        titleSpacing: -10,
        leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.bottomNavigation);
            },
            child: Container(
                height: 30,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.white,
                  size: 18,
                ))),
        title: GestureDetector(
          onTap: () {
            Get.offAllNamed(AppRoutes.bottomNavigation);
          },
          child: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image:  DecorationImage(
                image: AssetImage(
                  ImagesPaths.bgBlackShade,
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: CallAPI.getProfileDetails(
                    storage.read("userId").toString()),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Skeletonizer(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 42,
                              backgroundColor: AppColors.blackShade,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: AppColors.blackShade,
                              ),
                            ).paddingOnly(left: 30),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.5,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "snapshot.data.",
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ).paddingOnly(right: 3),
                                ),
                                SizedBox(
                                  height: Get.height * 0.003,
                                ),
                                SizedBox(
                                  width: Get.width*0.5,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "snapshot.data.result.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.003,
                                ),
                                Text(
                                  'View Activity',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.yellow,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        )
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.result == null) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
                  return
                    Row(
                    children: [
                      snapshot.data!.result!.profileImg == null
                          ? const CircleAvatar(
                              radius: 42,
                              backgroundColor: AppColors.yellow,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: AppColors.blackShade,
                                backgroundImage:
                                    AssetImage(ImagesPaths.profile),
                              ),
                            ).paddingOnly(left: 30)
                          :  CachedNetworkImage(
                        imageUrl: snapshot.data!.result!.profileImg.toString(),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 42,
                          backgroundColor: AppColors.yellow,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            backgroundImage: imageProvider,
                          ),
                        ),
                        placeholder: (context, url) => const CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.transparent,
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const CircleAvatar(
                          radius: 42,
                          child: Icon(Icons.error),
                        ),
                      )
                          .paddingOnly(left: 30),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width * 0.5,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              "${snapshot.data!.result!.userName == null?'':snapshot.data!.result!.userName.toString()} ${snapshot.data!.result!.lastName == null?'':snapshot.data!.result!.lastName.toString()}",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ).paddingOnly(right: 3),
                          ),
                          SizedBox(
                            height: Get.height * 0.003,
                          ),
                          SizedBox(
                            width: Get.width*0.5,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              snapshot.data!.result!.email == null?'':snapshot.data!.result!.email.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.003,
                          ),
                          Text(
                            'View Activity',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.yellow,
                                    fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              Container(
                height: 1,
                width: Get.width,
                color: AppColors.grey3,
              ).paddingOnly(left: Get.width * 0.01, right: Get.width * 0.01, bottom: Get.height * 0.03, top: Get.height * 0.03),
              Container(
                  height: Get.height * 0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.account);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.person,
                              width: 19,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.06,
                            ),
                            Text(
                              'Account',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white),
                            ),
                          ],
                        ),
                        Transform.translate(
                            offset: const Offset(-10, 0),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                              size: 20,
                            ))
                      ],
                    ),
                  )),
              SizedBox(
                height: Get.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.document);
                },
                child: Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.grey3),
                        color: AppColors.greyButton),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.document,
                              width: 22,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.057,
                            ),
                            Text(
                              'Documents',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white),
                            ),
                          ],
                        ),
                        Transform.translate(
                            offset: const Offset(-10, 0),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                              size: 20,
                            ))
                      ],
                    )),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.booking);
                },
                child: Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.grey3),
                        color: AppColors.greyButton),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.mysession,
                              width: 22,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.057,
                            ),
                            Text(
                              'My Sessions',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white),
                            ),
                          ],
                        ),
                        Transform.translate(
                            offset: const Offset(-10, 0),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                              size: 20,
                            ))
                      ],
                    )),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                  height: Get.height * 0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.support);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.support,
                              width: 20,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.06,
                            ),
                            Text(
                              'Support',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white),
                            ),
                          ],
                        ),
                        Transform.translate(
                            offset: const Offset(-10, 0),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                              size: 20,
                            ))
                      ],
                    ),
                  )),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                  height: Get.height * 0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton),
                  child: InkWell(
                    onTap: () {
                      // Get.to(BottomNavigationBarUI(currentTabIndex: 1,));
                      Get.toNamed(AppRoutes.earning);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.my_earning,
                              width: 20,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.057,
                            ),
                            Text(
                              'My Earnings',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white),
                            ),
                          ],
                        ),
                        Transform.translate(
                            offset: const Offset(-10, 0),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                              size: 20,
                            ))
                      ],
                    ),
                  )),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                  height: Get.height * 0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.bankingDetails);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.bank,
                              width: 20,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.057,
                            ),
                            Text(
                              'Bank Information',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.white,
                          size: 20,
                        ).paddingOnly(right: Get.width * 0.028)
                      ],
                    ),
                  )),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                  height: Get.height * 0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.bioEdit);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.bio,
                              width: 20,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.057,
                            ),
                            Text(
                              'Bio',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.white,
                          size: 20,
                        ).paddingOnly(right: Get.width * 0.028)
                      ],
                    ),
                  )),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                  height: Get.height * 0.05,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.grey3),
                      color: AppColors.greyButton),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.rating);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Image.asset(
                              ImagesPaths.starRating,
                              width: 20,
                              color: AppColors.white,
                            ),
                            SizedBox(
                              width: Get.width * 0.057,
                            ),
                            Text(
                              'Rating & Reviews',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.white,
                          size: 20,
                        ).paddingOnly(right: Get.width * 0.028)
                      ],
                    ),
                  )),
              SizedBox(
                height: Get.height * 0.05,
              ),
              inkButton(
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Montserrat'),
                  ),
                  onTap: () {
                    controller.onLogoutButton();
                  })
            ],
          ).paddingOnly(left: Get.width * 0.05, right: Get.width * 0.05),
        ),
      ),
    );
  }
}
