import 'package:flutter/foundation.dart';
import 'package:gameleven/app/data/utiles/api_url.dart';
import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import '../models/policy_model.dart';
import '../models/terms_condition_model.dart';

class PolicyTermsRepo extends GetConnect {

  Future<List<TermsConditionModel>> getTerms() async {
    List<TermsConditionModel> termConditionList = [];
    //const String apiUrl = '${ApiURL.baseApiUrl}Country';
    try {
      //Response response = await get(apiUrl, headers: headerData);

      termConditionList = [
        TermsConditionModel('1. Welcome', [
          StuTitleModel(
              subTitle:
              'Welcome to www……..com The following terms and conditions govern your (and any person or entity you enable/allow access through your access) access and use of this website (“Site”), the contents contained herein (“Contents”) and the services offered on the Site (“Services”).')
        ]),
        TermsConditionModel('2. Acceptance of terms', [
          StuTitleModel(
              subTitle:
              '2.1 In order to browse, use and/or access the Site and/or the Services you are required to agree to, comply with and be bound by the following terms and conditions. You will be deemed to have accepted these terms and conditions by browsing, viewing, accessing and/or using the Site and/or the Services offered on the Site.'),
          StuTitleModel(subTitle: '2.2 If you disagree with any part of these terms and conditions, please do not continue to browse, use and/or access the Site and/or the Services.')
          , StuTitleModel(subTitle: '2.3 In addition to these, there may be additional terms and conditions which apply to individual Services which you will be deemed to have accepted if you register for such Service.')
        ]),
        TermsConditionModel('3. Registration and use of the Services and/or Site', [
          StuTitleModel(
              subTitle:
              '3.1 In order to access/use or continue to access/use the Site and/or certain Services, you may be required to provide certain personal information. You agree to provide true, accurate, updated, and complete information when registering at the Site or for such Services.'),
          StuTitleModel(
              subTitle:
              '3.2 You agree to access/use the Site and/or Services only for purposes that are expressly permitted by (i) these terms and conditions and (ii) any applicable law, regulation, guideline or instruction from GBank Company Limited, the industry regulator or any other competent authority or any policy adopted by GBank Company Limited with regard to the acceptable access/use of the Site and/or Services.'),
          StuTitleModel(
              subTitle:
              '3.3 You agree that you are solely responsible and liable for (and that GBank Company Limited has no responsibility to you or to any third party for) any breach of your obligations under these terms and/or conditions and for the consequences (including any loss or damage which GBank Company Limited may suffer) for any such breach.'),
        ]),
        TermsConditionModel('4. Prohibited use of the Site, Services and/or Contents', [
          StuTitleModel(
              subTitle:
              '4.1 You specifically agree not to access/use (or attempt to access/use) any part of the Site and/or Services through any form of automated means (including use of scripts or web crawlers) and shall ensure that you comply with, in addition to these terms and conditions, instructions set out in relation to the access/use of any part of the Site and/or Services.'),
          StuTitleModel(subTitle: '4.2 You agree that you will not engage in any form of activity that interferes with or disrupts any part of the Site and/or Services (or the servers and networks which are connected to the Site and/or Services).'),
          StuTitleModel(subTitle: '4.2 You agree that you will not engage in any form of activity that interferes with or disrupts any part of the Site and/or Services (or the servers and networks which are connected to the Site and/or Services).'),
          StuTitleModel(subTitle: '4.4 You, and any person or entity you allow to access/use the Site and/or Services through your internet access/access to the Site and/or Services, are not allowed to:'),
          StuTitleModel(subTitle: '(a) Copy, disclose, modify, reformat, display, distribute, license, transmit, sell, perform, publish, transfer, link to, reverse engineer or decompile (except to the extent expressly permitted by applicable law) or otherwise make available any part of the Site and/or Services except as set out in these terms and conditions;'),
          StuTitleModel(subTitle: '(b) Include or create links (including deep-links) to or from the Site and/or Services;'),
          StuTitleModel(subTitle: '(c) Replicate the Site and/or Services or create a separate border around any part of the Site and/or Services (also known as "framing");'),
          StuTitleModel(subTitle: '(d) Replicate the Site and/or Services or create a separate border around any part of the Site and/or Services (also known as "framing");'),
          StuTitleModel(subTitle: '(i) In breach of any law, regulation, guideline or instruction invoked by GBank Company Limited, industry regulator or any other competent authority or any policy adopted by GBank Company Limited with regard to the acceptable access/use of the Site and/or Services, or'),

          StuTitleModel(subTitle: '(i) In breach of any law, regulation, guideline or instruction invoked by GBank Company Limited, industry regulator or any other competent authority or any policy adopted by GBank Company Limited with regard to the acceptable access/use of the Site and/or Services, or'),
          StuTitleModel(subTitle: '(ii) Abusive, indecent, defamatory, obscene, pornographic, offensive or menacing or that has the effect (as may be contemplated by a reasonable person) of causing the recipient to feel so harassed, abused or offended; or'),
          StuTitleModel(subTitle: '(iii) Designed to cause annoyance, inconvenience or needless anxiety to any person or entity; or'),
          StuTitleModel(subTitle: '(iv) In breach of confidence, intellectual property rights, privacy or any right of a third party.'),
          StuTitleModel(subTitle: '(e) Hack into, make excessive traffic demands, probe or port scan other computers, deliver viruses, mail bombs, chain letters or pyramid schemes or otherwise engage in any other behaviour intended to inhibit other users from accessing/using any part of the Site and/or Services or any other website or services;'),
          StuTitleModel(subTitle: ''' (f) Collect and process others' personal data except in accordance with applicable data protection law and these terms and conditions;'''),
          StuTitleModel(subTitle: ''' (h) Infringe any other person's or entity’s intellectual property rights;'''),
          StuTitleModel(subTitle: '(i) Use the Site and/or Services to harvest or collect information about users of the Site and/or Services or to post or otherwise distribute unauthorized or unsolicited advertising, junk or bulk email (also known as "spam"); (j) Use any part of the Site and/or Services in any way that we in our sole and absolute discretion consider objectionable, inappropriate, likely to injure our business, brand, goodwill, reputation or otherwise unacceptable;'),
          StuTitleModel(subTitle: '(k) Use the Site and/or Services to send emails and other content coached, phrased or written in such a manner as to give an impression that the email is correspondence from GBank Company Limited.'),
          StuTitleModel(subTitle: '4.5 You are responsible for any misuse of the Site and/or Services even if it is by another person or entity using your access to the Site and/or Services.'),
          StuTitleModel(subTitle: '4.6 We reserve the right to block, remove, edit or refuse to post any material that you attempt to transmit through the Site and/or Services that we deem to be in contravention of these terms and conditions and to take such other action as we in our sole and absolute discretion consider necessary to prevent or remedy any breach of these terms and/or conditions. If you become aware of any content or material circulated using the Site and/or Services that is in breach of these terms and/or conditions, Contents or materials on the Site and/or Services then we encourage you to promptly inform us by contacting our customer care center at 16247. We are not responsible or liable for any failure to remove, block, edit or delay in removing, etc. any such infringing content or material or third party material from the Site and/or Services or for any good faith but wrongful removal of third party material.'),
        ]),
        TermsConditionModel('5. The information we may collect', [
          StuTitleModel(
              subTitle:
              '2.1 In order to browse, use and/or access the Site and/or the Services you are required to agree to, comply with and be bound by the following terms and conditions. You will be deemed to have accepted these terms and conditions by browsing, viewing, accessing and/or using the Site and/or the Services offered on the Site.'),
          StuTitleModel(subTitle: '5.1 We may collect, inter alia, the following information from you:'),
          StuTitleModel(subTitle: '(a) Full Name;'),
          StuTitleModel(subTitle: '(b) Shop/Business/Institute Name;'),
          StuTitleModel(subTitle: '(c) Business/Institute Type;'),
          StuTitleModel(subTitle: '(d) Contact Information including Mobile Number, E-mail Address; and'),
          StuTitleModel(subTitle: '(e) Other Information relevant to Registration, Surveys, and/or Offers.')
        ]),
        TermsConditionModel('6. Use of your Information', [
          StuTitleModel(
              subTitle:
              '6.1 GBank Company Limited may hold and use information provided by you for a number of purposes, which may include:'),
          StuTitleModel(subTitle:'(a) Carrying out any activity in connection with a legal, governmental or regulatory requirement on GBank Company Limited in connection with existing or prospective legal proceedings or in respect of any crime or fraud prevention, detection or prosecution.'),
          StuTitleModel(subTitle:'(b) Monitoring and/or recording of your communications GBank Company Limited’s business purposes such as marketing, quality control and training, prevention of unauthorized use of GBank Company Limited ‘s technical systems and ensuring effective systems operation in order to prevent, detect or prosecute any crime or fraud.'),
          StuTitleModel(subTitle:'(c) Share such information with third parties for GBank Company Limited ‘s business purposes such as marketing, quality control and training, acquisition of customers, agents, and/or merchants, customer services, etc.'),
          StuTitleModel(subTitle:'(a) Carrying out any activity in connection with a legal, governmental or regulatory requirement on GBank Company Limited in connection with existing or prospective legal proceedings or in respect of any crime or fraud prevention, detection or prosecution.'),
          StuTitleModel(subTitle:'6.2 In addition to the above, any information we may collect from you may be used, inter alia, for the following purposes:'),
          StuTitleModel(subTitle:'(a) To provide GBank Company Limited Products and Services;'),

          StuTitleModel(subTitle:'(a) To provide GBank Company Limited Products and Services'),
          StuTitleModel(subTitle:'(b) For internal record keeping'),
          StuTitleModel(subTitle:'(c) To improve the Site (we continually strive to improve our website based on the information and feedback received from you)'),
          StuTitleModel(subTitle:'(d) To send periodic e-mails'),
          StuTitleModel(subTitle:'(e) To administer a contest, promotion, survey or other Site feature')
        ]),
        TermsConditionModel('7. Intellectual Property Rights', [
          StuTitleModel(
              subTitle:
              '7.1 All copyright, trademarks, patents, brand names, corporate names and other intellectual property rights in any material or content (including without limitation software, data, applications, information, text, photographs, music, sound, videos, graphics, logos, symbols, artwork, designs, layout, look, appearance and other material or moving images) contained in or accessible via the Services ("Contents") is either owned by GBank Company Limited or has been licensed to GBank Company Limited by the rights’ owner(s) for use as part of the Services and/or on the Site. The GBank Company Limited name, logo and the bird device/mark are registered trademarks GBank Company Limited. All trademarks reproduced herein, which are not the property of or licensed to GBank Company Limited, are the property of their respective owners.'),
          StuTitleModel(subTitle: '7.2 You are only allowed to access/use the Site and/or Services as set out in these terms and conditions. If you wish to access/use the Contents or any part thereof for any other purpose other than reviewing it on the Site, then you will be required to obtain the prior written permission of the owner of the rights in that material. All rights are expressly reserved.'),
          StuTitleModel(subTitle: '7.3 Having noted the above you shall not be entitled in respect of any Contents (wholly or partly):')
          ,StuTitleModel(subTitle: '7.4 Any unauthorized access/use of this Site, Services and/or Contents may give rise to a claim for damages, penalty, losses, legal suit and/or amount to a criminal offence. Further, you will also be liable for all costs and consequences arising out of any claim, demand, penalty, proceeding or legal suit (civil or criminal) initiated as a result of your unauthorized access/use of this Site, Services and/or Contents.')
          , StuTitleModel(subTitle: '7.5 Any unauthorized use, reproduction or alteration of the UCB Fintech Company Limited name, logo, the bird device/mark and/or any components of the same are strictly prohibited and GBank Company Limited will utilize all resources to claim, demand, bring legal proceedings against such unauthorized use, reproduction or alteration and extend all out efforts to penalize, prosecute and seek compensation, damages, losses and costs from such persons or entities.')
        ]),
        TermsConditionModel('8. No Warranties', [
          StuTitleModel(
              subTitle:
              '8.1 Any information or materials provided herein is solely for your personal information and convenience, and is not intended for commercial use, nor for trading or investing purposes, and therefore should not be treated as a representation or offer of any kind. Such information or materials are not appropriate for the purposes of making a decision to carry out a transaction or trade, nor does it provide any form of advice (investment, tax, legal) amounting to investment advice, or make any recommendations regarding particular financial instruments, investments, products or services.'),
          StuTitleModel(
              subTitle:
              '8.2 The information contained in this Site, Services and/or Contents may be out of date and/or may contain other errors or omissions. GBank Company Limited provides the Services and Contents on the Site "as is" and makes no warranties of any kind, either express or implied, with respect to the Services and/or the Contents (including without limitation regarding their satisfactory quality, freedom from viruses or other harmful components, fitness for a particular purpose, suitability, reliability, timeliness, accuracy, completeness, security or that they are free from error).'),
          StuTitleModel(
              subTitle:
              '8.3 Neither GBank Company Limited nor any third party provides any warranty or guarantee or assume any liability or responsibility as to the accuracy, timeliness, performance, completeness, suitability or otherwise of the information or materials (including but not limited to Contents, Services, activities or offers) found, offered or represented on this Site for any particular purpose. You acknowledge that such information, materials, Contents, Services, activities or offers may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.'),
          StuTitleModel(
              subTitle:
              '8.4 GBank Company Limited reserves the right to replace or amend the features, facilities and charges, and the information and materials pertaining to such features, facilities and charges, in relation to the Services, Contents, Site and GBank Company Limited Products and Services at any time. All GBank Company Limited Products and Services offered are subject to the standard Terms and Conditions for GBank Company Limited Products and Services.')
        ]),
        TermsConditionModel('9. Third Party Hyperlinks and Websites', [
          StuTitleModel(
              subTitle:
              '9.1 From time to time, this Site may also include links to other websites. These links are provided for your convenience and to provide further information only.'),
          StuTitleModel(subTitle: '9.2 The inclusion of such links to third party websites not controlled by us does not imply any endorsement by us of such websites and as such any transaction you may make with any third party flowing from such links is carried out entirely at your own risk and we accept no liability for any damages or losses that you may suffer as a result.'),
          StuTitleModel(subTitle: '9.3 These third party websites have separate and independent terms and conditions and privacy policies for their access/use. Neither we nor any third parties provide any warranty or guarantee or assume any liability or responsibility as to the accuracy, timeliness, performance, completeness, suitability or otherwise of the information or materials (including but not limited to contents, services, activities or offers) found, offered or represented on the linked website(s) for any particular purpose. You acknowledge that such information or materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law. GBank Company Limited explicitly disclaims any responsibility or liability as to any consequential losses or damages arising as a consequence of any of the above.')
        ]),
        TermsConditionModel('10. Use of Cookies', [
          StuTitleModel(subTitle: '10.1 We do not use cookies at or in our Site. However, we do not take any responsibility of any third party websites whose links have been included in our Site as to whether such websites use cookies or not.'),
        ]),
        TermsConditionModel('11. Liability', [
          StuTitleModel(
              subTitle:
              '11.1 You are responsible to verify the authenticity of the recipient(s) and the nature of the transaction(s) before doing any transaction. You are also responsible to verify the accuracy and to be careful about entering ‘Receiver GBank Company Limited Account Number’, ‘GBank Company Limited Account Number’, ‘Agent GBank Company Limited Account Number’, ‘Amount’, ‘GBank Company Limited Mobile Menu PIN’, ‘GBank Company Limited ATM Cash Out PIN’, ‘Security Code’, ‘Secret Code’, and other information relating to your GBank Company Limited Account transactions. You must never share your ‘GBank Company Limited Mobile Menu PIN’, ‘GBank Company Limited ATM Cash Out PIN’, ‘Security Code’, ‘Secret Code’ or any other information of a secure nature with anyone. GBank Company Limited provides a secure transaction platform only, and will not be liable in any way for any human error, misrepresentation or fraudulent activity arising from use of GBank Company Limited Products and Services.'),
          StuTitleModel(subTitle: '11.2 Your use/access of any information or materials on this Site is entirely at your own risk. It shall be your own responsibility to ensure that any products, services, or information available through this Site meet your specific requirements. We shall not be liable or responsible in any regard whatsoever for your use/access of any information or materials on this Site.'),
          StuTitleModel(subTitle: '11.3 GBank Company Limited shall not be liable for any loss of use, access, profits or data or any direct, indirect, special or consequential damages or losses, whether such losses or damages arise in contract, negligence, tort or otherwise including without limitation to the foregoing any damages or losses in relation to:')
        ]),
        TermsConditionModel('2. Acceptance of terms', [
          StuTitleModel(
              subTitle:
              '2.1 In order to browse, use and/or access the Site and/or the Services you are required to agree to, comply with and be bound by the following terms and conditions. You will be deemed to have accepted these terms and conditions by browsing, viewing, accessing and/or using the Site and/or the Services offered on the Site.'),
          StuTitleModel(
              subTitle:
              '2.2 If you disagree with any part of these terms and conditions, please do not continue to browse, use and/or access the Site and/or the Services.')
        ]),
        TermsConditionModel('12. Indemnity by You', [
          StuTitleModel(
              subTitle:
              '12.1 You irrevocably agree to indemnify GBank Company Limited, G  Bank Limited and any of our third party providers (hereinafter collectively referred to as the “Indemnified Parties”) fully against and to hold the Indemnified Parties harmless on demand from all losses, damages, demands, claims, proceedings, suits, costs and expenses (including reasonable legal costs and expenses) and liabilities howsoever incurred by the Indemnified Parties as a result of any claims, demands, proceedings or suits by a third party resulting from your use/access of the Site, Services and/or Contents in breach or non-observance of these terms and conditions.'),
          StuTitleModel(
              subTitle:
              '12.2 We shall notify you of any such claims, demands, proceedings or suits that we or any of the other Indemnified Parties receives and you hereby agree to provide us and/or any of the Indemnified Parties with full authority to defend or settle such claims, demands, proceedings or suits and shall provide us and/or any of the Indemnified Parties with all reasonable assistance necessary to defend or settle such claims, demands, proceedings or suits at your sole cost and expense.')
        ]),
        TermsConditionModel('13. General', [
          StuTitleModel(subTitle: '13.1 The information and materials provided in relation to the Contents and Services on the pages of this Site are for your general information and use/access only and any part of such information and materials is subject to change without notice at our sole discretion.'),
          StuTitleModel(subTitle: '13.2 GBank Company Limited reserves the right to review, revise, amend and/or change the Services, Contents, Site, its policies and/or these terms and conditions at any time without any prior notice and you will be deemed to have been bound by such revision, amendment or change by continuing to use/access the Site, Services and/or Contents.'),
          StuTitleModel(subTitle: '13.3 The construction, validity and performance of these terms and conditions shall be governed in all respects by the prevailing laws of …….. Your use/access of this Site and any dispute arising out of such use/access of the Site is also subject to the prevailing laws of …...'),
          StuTitleModel(subTitle: '13.4 If any or any part of the provisions of these terms and conditions are declared by any judicial or other competent authority to be void, voidable, illegal or otherwise unenforceable, such a term shall be amended or at the discretion of GBank Company Limited it may be severed from these terms and conditions and the remaining part of the affected provision and other remaining provisions of these terms and conditions shall remain in full force and effect.'),
          StuTitleModel(subTitle: '13.5 Except where these terms and conditions provide otherwise, the rights and remedies contained herein are cumulative and not exclusive to rights and remedies provided by law. The failure GBank Company Limited to enforce at any time or for any period any one or more of the terms and conditions shall not be a waiver of them or of the right at any time subsequently to enforce all terms and conditions.'),
          StuTitleModel(subTitle: '13.6 No delay or failure by GBank Company Limited shall constitute a breach or give rise to any claim for damages or loss including loss of anticipated profits if such delay or failure is caused by force majeure. Force majeure shall mean an occurrence which is beyond and without fault or negligence of GBank Company Limited and which GBank Company Limited is unable to prevent or provide against by the exercise of reasonable diligence including, but not limited to, acts of God or of the public enemy, appropriation of confiscation of facilities, terrorist activity or other catastrophe, strike or any other concerted acts of employees or other similar occurrences.'),
          StuTitleModel(subTitle: '13.7 You shall not assign these terms and conditions to a third party. GBank Company Limited may assign these terms and conditions in whole or part to any third party at its discretion.'),
          StuTitleModel(subTitle: '13.8 You acknowledge that in agreeing to these terms and conditions you do not rely on, shall have no remedy in respect of, any statement, representation, warranty, guarantee or understanding (whether negligently or innocently made) of any person (whether party to these terms and conditions or not) other than as expressly set out in these terms and conditions as a warranty.'),
          StuTitleModel(subTitle: '13.9 By visiting www………..com, you agree that the laws of the People’s Republic of Bangladesh, irrespective of principles of conflict of laws, will govern these terms and conditions and any dispute of any sort that might arise between you and GBank Company Limited.'),
          StuTitleModel(subTitle: '13.10 In the event that we decide to permanently withdraw the Services, Contents and/or the Site, GBank Company Limited shall not be liable to you for any ensuing loss or damage occasioned to you from such a suspension, change or termination. Termination shall however not affect your accrued liabilities towards us.'),
        ]),


      ];

      if (200 == 200) {
        return termConditionList; // countryModelFromJson(response.body);
      } else {
        return [];
      }
    } catch (error) {
      print(error);
      return [];
    }
  }

  Future<List<PolicyModel>> getPolicy() async {
    // const String apiUrl = '${ApiURL.baseApiUrl}Country';
    List<PolicyModel> policyList = [];
    try {
      //Response response = await get(apiUrl, headers: headerData);

      policyList = [
        PolicyModel('Policy', [StuPolicyTitleModel(subTitle: 'This privacy policy has been compiled to provide a clear description of with how Personally Identifiable Information (PII) of our valued customers is being used online. It applies to all Customers, Buyers and Users (collectively referred to as "Users") as well as all products and services of GBank MFS . Please go through our privacy policy thoroughly for getting an explicit description of how we collect, protect or otherwise handle your Personally Identifiable Information in accordance with our App.')]),
        PolicyModel('Collection and Use of Information', [
          StuPolicyTitleModel(subTitle: 'Some personally identifiable information (PII) might be required while you use our Service. However, this information will be retained in your device and will not be collected, sold, traded or otherwise transferred to outside our parties in any way. Our primary goal in doing so is to conduct internal research on your demography, needs and interest to provide you a safe, efficient, smooth and customized service as well as to protect your interest. We do proper measures to secure your information.')
        ]),
        PolicyModel('Third party services ', [
          StuPolicyTitleModel(
              subTitle:
              'The app uses third party services that may collect information used to identify you. Link to privacy policy of third party service providers used by the app Google Play Services')
        ]),

        PolicyModel('Log Data  ', [
          StuPolicyTitleModel(
              subTitle:
              ''' In a case of an error in the app while you use our service, we collect data and information (through third party products) on your phone, called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.''')
        ]),


        PolicyModel('Disclosure of personal Information', [
          StuPolicyTitleModel(
              subTitle:
              ''' # Relevant Members/Partners/Vendors/Payment Gateway/Bank/Financial Institutes to provide joint content and services (like registration, transactions, fund collection and customer support), to help detect and prevent potentially illegal acts and violations of our policies, and to guide decisions about their products, services and communications. Members of our corporate family will use this information to send you marketing communications only if you've requested their services.'''),
          StuPolicyTitleModel(
              subTitle:
              '''# Service providers under contract who help with our business operations (such as fraud investigations, bill collection, affiliate and rewards programs and co-branded credit cards).'''),
          StuPolicyTitleModel(
              subTitle:
              '''# Other third parties to whom you explicitly ask us to send your information (or about whom you are otherwise explicitly notified and consent to when using a specific service).'''),
          StuPolicyTitleModel(
              subTitle:
              '''# Law enforcement or other governmental officials, in response to a verified request relating to a criminal investigation or alleged illegal activity. In such events, we will disclose information relevant to the investigation.'''),
          StuPolicyTitleModel(
              subTitle:
              '''# For any confidentiality agreement between GBank MFS and any other organization, we in our sole discretion believe necessary or appropriate in connection with an investigation of fraud, intellectual property infringement, piracy, or other unlawful activity. In such events, we will disclose necessary information.'''),
          StuPolicyTitleModel(
              subTitle:
              '''# Other business entities, should we plan to merge with or be acquired by that business entity. (Should such a combination occur, we shall require that the new combined entity follow this privacy policy with respect to your personal information. If your personal information will be used contrary to this policy, you will receive prior notice.)'''),
          StuPolicyTitleModel(
              subTitle:
              '''# Without limiting the above, in an effort to respect your privacy and our ability to keep the community free from bad actors, we will not otherwise disclose your personal information to law enforcement, other government officials, or other third parties without a subpoena, court order or substantially similar legal procedure, except when we believe in good faith that the disclosure of information is necessary to prevent imminent physical harm or financial loss or to report suspected illegal activity.''')
        ]),
        PolicyModel('Permissions', [
          StuPolicyTitleModel(
              subTitle:
              'For better experience, our app requires access to some information such as Contacts, Location etc. and we will be taking permission from you while you use our service.”).')
        ]),
        PolicyModel('Cookies', [
          StuPolicyTitleModel(
              subTitle:
              'A “cookie” is a small piece of information stored by a web server on a web browser so it can be later read back from that browser. “Cookies” are not used explicitly by GBank MFS. Nevertheless, the app may use third party code and libraries that use “cookies” to collect information to upgrade their services. You can either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you might be precluded from some portions of this Service.')
        ]),
        PolicyModel('Service Providers', [
          StuPolicyTitleModel(
              subTitle:
              'A “cookie” is a small piece of information stored by a web Third-party companies and individuals may be employed by us due to the following reasons:'),
          StuPolicyTitleModel(subTitle: 'To facilitate our Service'),
          StuPolicyTitleModel(
              subTitle: 'To provide the Service on our behalf;'),
          StuPolicyTitleModel(
              subTitle: 'To perform Service-related services; or'),
          StuPolicyTitleModel(
              subTitle: 'To assist us in analysing how our Service is used.'),
        ]),
        PolicyModel('Security', [
          StuPolicyTitleModel(
              subTitle:
              'Your password is the key to your account. Use unique numbers, letters and special characters as designed the platform of GBank MFS and do not disclose your Account password to anyone. If you do share your password or your personal information with others, remember that you are responsible for all actions taken in the name of your account. If you lose control of your password, you may lose substantial control over your personal information & wallet and may be subject to legally binding actions taken on your behalf.'),
          StuPolicyTitleModel(
              subTitle:
              'We thrive to create an environment of transparency and honesty and value the trust you put in us providing your Personal Information, thus we are striving to use commercially acceptable means of protecting it. We treat data as an asset that must be protected and use lots of tools (encryption, passwords, physical security, etc.) to protect your personal information against unauthorized access and disclosure. But please remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.')
        ]),
        PolicyModel('Security', [
          StuPolicyTitleModel(
              subTitle:
              'Your password is the key to your account. Use unique numbers, letters and special characters as designed the platform of GBank MFS and do not disclose your Account password to anyone. If you do share your password or your personal information with others, remember that you are responsible for all actions taken in the name of your account. If you lose control of your password, you may lose substantial control over your personal information & wallet and may be subject to legally binding actions taken on your behalf.'),
          StuPolicyTitleModel(
              subTitle:
              'We thrive to create an environment of transparency and honesty and value the trust you put in us providing your Personal Information, thus we are striving to use commercially acceptable means of protecting it. We treat data as an asset that must be protected and use lots of tools (encryption, passwords, physical security, etc.) to protect your personal information against unauthorized access and disclosure. But please remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.')
        ]),
        PolicyModel('Links to Other Sites', [
          StuPolicyTitleModel(
              subTitle:
              'This Service may contain links to other sites. If you click on a third-party link, you will be redirected to that particular site. Please do note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites while you proceed. We inform you that we have no control over and shoulder no responsibility for the content, privacy policies, or practices of any third-party sites or services.')
        ]),
        PolicyModel('Children’s Privacy', [
          StuPolicyTitleModel(
              subTitle:
              'These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided GBank MFS with their personal information, we immediately discard this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, you are requested contact us so that we can take necessary actions.')
        ]),
        PolicyModel('Changes to This Privacy Policy', [
          StuPolicyTitleModel(
              subTitle:
              'We may amend this Privacy Policy at any time by posting the amended terms on this site. All amended terms automatically take effect instantly after they are initially posted on the site. Thus, you are suggested to review this page periodically for any changes. We will notify you of any changes by posting a notice of the change (or an amended Policy) on this page. These changes are effective immediately after they are posted on this page.')
        ]),
      ];

      if (200 == 200) {
        return policyList;
      } else {
        return [];
      }
    } catch (error) {
      print(error);
      return [];
    }
  }


  Future webSettingInfo() async {
    Uri apiUrl = Uri.parse( ApiURL.webSiteInfo);
    if (kDebugMode) {
      print(apiUrl);
    }
    try {
      final response = await http.get(apiUrl);
      if (kDebugMode) {
        print('PolicyTermsRepo.webSettingInfo');
        print(response.statusCode);
          print(response.body);
      }
      return response.body;
    } on Exception catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    } catch (error) {
      print('web settings  error >>> $error');
      throw Exception(error);
    }
  }
}
