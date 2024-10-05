-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2024 at 03:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fingerprint`
--

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `leave_time` time NOT NULL,
  `return_time` time NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','denied') DEFAULT 'pending',
  `request_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `extended_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `user_id`, `leave_time`, `return_time`, `reason`, `status`, `request_time`, `extended_time`, `created_at`) VALUES
(1, 4, '10:00:00', '12:40:00', 'my reason', 'denied', '2024-10-03 00:44:48', NULL, '2024-10-03 00:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `indexfinger` varchar(4000) DEFAULT NULL,
  `middlefinger` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `password`, `role`, `indexfinger`, `middlefinger`) VALUES
(1, 'ola', 'olauser', '', '', '', 'APgwAcgq43NcwEE3CatxsK0UVZKBwE640lfL2UgFd60DPWzTcQ5697DXeJNIj1KQHNAFTpeFfAv7GaMiUS2NG4fSaP-4n93uDR9viL6qi3tD6_ju1Zai0uH7oGPNIWwZw97O1dhroaMPqWmUtdzhgmUowu_AIadqvIMPcMoIfkuxs6pN5vBqwHb_6j2pwGV4DT7BHxNQrkk8EIX2Z50iMjWfmuooU7Q4ihiY8E01dTQVOLQcimsXi8lnOaDZZZLLlVY6tmrNLT9x5N_a2ss83hduG0IlBjF5_i0T46JxRZG_dVMTT1EFBkzIGRvxoZIH_-Uuj4S-FZv2eIUsHtAZmol-AXd5xfEhIuyvH56WvHqjOS-_T832Hi-2P0nRB_JAgEEeo3YM_R2cOKKsqh4G5Soq_mNvAPhSAcgq43NcwEE3CatxMKIUVZKzTpJbFudw2dNceScWVylZf0G05kyQyiSLM1jOIlvziZD2Bd_3T56pGNdHCDVtOs8ZKuIRwjONxkSnCSL0SsH_5QRgvyG2kTB2SGR0PnptBDcfxFMzwGDc6q19vR-beYNyvMYOyHB9OPQH0nEST6DbHnl0UoPQiVBL8PM4Jlj6W1fhBt6QklOwvAVUiE4O8uWKvaqnQakZE9cxRcCvJleNW5Ya8n2utP72_m1jkptbRAU0LdWKgPyPlRBiiR6IklZV_9x7If8lc1lEDLml9a0mXGqsIv4OAAQK-XfZHbny0IL8BYt-ywVSD4TJvgbQmp59yE8mAdtVsmkELhRDZ7LMKrVl-jgGSXFkODAI2qLKCR9T0AfgtRs_muHYRLdtvK9FSUHtWPSQ7BaAMIjdmfzyRP3i8ZDcrpVrzPHKSIWvpx3PbwD4egHIKuNzXMBBNwmrcbCTFFWSSZAoHsjDHVSijab_oGXuRxjSuA7Yokbfkt5gOxgWRmdJ4a18Ya5NeQKQCsa_kt0jZq48CJq4p3I3Lo_T7RPAQ2bcXfT7XtOodzf1y9uPuxoJ6_Z99oDlEAYXaW4-Bt-EBp4IDBqNLOsf3YkfPStuKl6se992kWK632-dGQMvKLrCFQepPvhGoezU6N06jzWsc4zDM6FiAB0ryDaMoKarZ1pUe_2Gw44HOPh9nnkrRQ-pUmB_vDx4Yy54qQOz9nRhPCa12B6KGmJh6lOS954Cz5C44K8OsbiN3FqFqqcvJACJYHn74XTgsTN4dGoSqMHtTELpk9GZ1NoosYOS_D8WiSaAjxt88EpMI_3Nh0R6ij6F6e_2yxw5D4SnYTF0EeLW9GMbpRk5Xi5kEOwCIPP6TufvLh2MrE4gESp_hLH_rLVJ7CxfK65xgTc3DSCpFBw8LZ8GGmfV_1BndgOVLUEhK4f-2YrxZlCuVyVvAOgtAcgq43NcwEE3CatxcIAUVZI_VhxRkU_V7ypBR4F3DxoXiFgKR2_TrY997DKh2FY7TCZRWLiyvz-Zgq3_heDx5XcZxLdAifaQyO9kCItaa4iK-k4oUWEPf94wDYsA_hI2tj-sEFZhOOHKk6XX8dhxbScDm_CxuWwu9gojAH2UIhkFODYAK11aP1gU2dkSGLyxw-KlRbcy9A1lKUMVN12nqFHBQd1Rs7iY1qRFUncOjH8UeIN8f-AKj1hdqtpNTXe4of8S08B4Def1VX5AuLm3QfzDkiBNO2EfUqJY5Fr6SsdTETrTGXt6ipqRRslL69pczBY4I5Rd_O67fUsflRsQg4kLJt1_AQpA8V3jueM3rYSvOT-F42v4k0tmYfKwMz1iSURKWLuA5XMGs8AbAIRvfwAAoPcBHNp_AACkh1hgWVUAAPB0CjPafwAA46aTYFlVAAAI-QEc2n8AAIjUARzafwAAUEoCFNp_AABQ3wEc2n8AACB1CjPafwAAb-d_YFlVAAAI-QEc2n8AAHDUARzafwAA8hAAAEgAAACI1AEc2n8AAFB1CjPafwAAQbiTYFlVAABQSgIU2n8AAAj5ARzafwAAcNQBHNp_AABw2wEc2n8AAIB1CjPafwAAe7iTYFlVAAAI-QEc2n8AAHDUARzafwAAUEoCFNp_AABw2wEc2n8AALB1CjPafwAAb-d_YFlVAAAI-QEc2n8AAFjUARzafwAA4HUKM9p_AABw1AEc2n8AAOB1CjPafwAAr9KTYFlVAAAI-QEc2n8AAFjUARzafwAAsNgBHNp_AAA', 'APhjAcgq43NcwEE3CatxcL4UVZKvoHFC6AsW1s75_P-yQ13sR3Qpled4K7b-xt1CyrR6z_aZTTfF4Gdhyu-agL9iZg4ssEm1TdBnMz5s1WYFN4EK8eUtgrnKiNM9tT62em3ghApe0gca5_wj_jorf1hg_kZUpipWaaRsqQcq3dOeM7rVK_wa4nPA2td68lMEfa-c9kjto1vNkzCwGvQHw0jI9vRD0s0Z20r0G0BbHVp0yM_-fVHJFN9rRaAqZ9Es3sFKpK-dsdu9_EA2qP-n4Rsm8uRLCorb3ecrcn56G0H9Lg2eCTSYEGePBA5v12IchTKDPAKD_fFrPVJbuIMJ67JNroFwk3DX4jICoo2gGn2cfmq-PteCaYtVuFZip-7jyIckSPrrs9mElDnNnb6ljI-Amjwo2OG1VYdZnlCvDjRnauBgW2I8leA4_Chg65Hx2rRO7kZ_vnunhoKW3aqBCzui5lQb-WZvAPiAAcgq43NcwEE3CatxMKkUVZJyjDkccAdN9d8rp7BtSeAWKFG_RHr1bYRAMF5Hk875djr1ozA24Ots70vrdB7SPYeeXtUEGrH3wKkZv9s48v5KsFXVjC93ND0QHsrJwUV7nUVYtgQBKfn4z53aAXTEY9BcRcqVDyCbrcAu6m-SHD2fT3l-afLcTT2oK1ptZBXpSJH2Bi3VrDzcabpW0D9ohinC6KGaaAeBtQdep60D_Nrb8gHPaM6N8QsOvmN8EUJIc6D2RA-ee0pfKbg4tiDksxdPsLzW41DUYQ7pMxyJmkKuOQHoBiusgM9mxoI7fIhZBzAIZiW0CCubAXFbPVhgZ8WbTQk_HnOYnNyYeht_TUtkny2oPiJfNj62eZ_thpAovXu_8p4JOcyI7U578DLe1WzfdeMM1ha8pfwFt--ST9F1_RlXSNOtmeBBe3AJYaImPZ095WO9_uhr0jsdsLw6E4TGLdMeo5TCh6AOUAB1j-vq9JzR1d0sSqG607wYKSQ0zW8A-HIByCrjc1zAQTcJq3EwkBRVkow_k1v-HLqZN4dvq8B1ZgozKhsN0DABOHR5d1WUG-OwPrbFV71OlaJOqEZ5JvwHDuN8wEdvPc3CeKnA7HizcVzVLS4yCdNMHVdqRk3pV0TxS6YInc6TU7hUeNMtng-qeSGDRHbqMBRZA9bu4-_8tYEz5qtdZ9clmvv3Mqb3LAUSXdfRfnHkxxXwF0KoxNQY77TMtCfSJzH09vojndbtwu-N_e8ScLujfyqxNMA0N7RBGZ9cHUActrB-3T95AshUsjcOhgqK1OAPv8ycTGVj-Sul35Wl7UOGSoEn467f_pYGyCgHgD0ckiMy7Fen_pgYn2Cvm44Rcp4bFWMyirdgxQhm4ph0XbSQ1GVXOb4-BxipGsRdWItGiPG68DCc8lWzRdmB8_fnew4ufdOxvgMaTXxaZ4iMI6PFME4_wpMcJH-e0Ecx5ULXiNHCcivkeR85GrKvMGyi1DK8N5g0qSawmBpQ8G8A6DkByCrjc1zAQTcJq3FwlBRVks8JXaxmyERHe0GZSaGTSHY-u2cXG2MMadzAKm-lECvt5u6BJk584VTiovZu2qwBu-NPbEJAJv2w9Uku1r1f6RxSv-_XYjida_B3Kr1FSdSRQ2PUGvBOO88cdboF1VJHJVg_jgz9S59K8suj4RbMzKcC5DbyYtoJquGTpS-XR1ckkMmP7Am0QHb_bTP_liU5v6dS91hR-ma94oK_r4CSJ7XVvcrDnqkgWF5_sKaed1fxDsay-Cn68gprQ-AqhzQvndfQ9yIe7p4a5Tjl3vrnPgyOfHV6BKGSzhbIRehuuYnjVDoMfj__2H-sWOhynCSycmvB0Ni6vdQs-mjRATVgcdwkOJHz2lw519MvkX9NfmvlMKE_0OzHrm67thsQiho9fpAG_lGF3Od7em8AADAAAABIMwEU2n8AAFBVCjLafwAAQbiTYFlVAACwEQQc2n8AAMhXARTafwAAMDMBFNp_AAAwOgEU2n8AAIBVCjLafwAAe7iTYFlVAADIVwEU2n8AADAzARTafwAAsBEEHNp_AAAwOgEU2n8AALBVCjLafwAAb-d_YFlVAADIVwEU2n8AABgzARTafwAA4FUKMtp_AAAwMwEU2n8AAOBVCjLafwAAr9KTYFlVAADIVwEU2n8AABgzARTafwAAcDcBFNp_AAA'),
(2, 'sam', 'sam ade', '', '', '', 'APiBAcgq43NcwEE3Catx8K8UVZKOGwujjPiAJylR-DIijaWulhGCY6QxpTD9OKttxbBOxSW0tA0FhyGPCG6zORz386o_nQWBAqVZiG-Y9R4HX1lU0eUhuLPxC5LQS0DC5WSt6MqS15JC-bwDeFo6VI3xflN6m_CgiyG52fRU4lKfRDAywQ8qMfX3-CgN9oHVUYrFe_kxxgM0EJTEz3gKqE-Fg9iob2vEjbY07dGdaX_mz_0WHFNJqzKaNTxpFXSMreCgs9ZYh0kfiEHs5zIYXwylNa_aJoXYplSFv_YqfHo43KZFTNowWBwS4qY0s5dmPvPc1pfqxOLiDcTGQ35Xm5YLjebaMFPzuHrSBFnC90xvXKL503Aw7bYU4PEQltsOUPlNLjLQ9clz4FUiOGectsiov5uh1dQtzxirT4Kp1-3i3uwet5CToHZ8zKGGCoxFZtE4t-QDRpOEcL9_2Uz61dZp44IxNAJxVp36pj4cC1xPCwQ_7yyLQKFeNk_VRIIBP8PuNRNvAPh_Acgq43NcwEE3CatxsKsUVZKMdRPXQ0XboOqr-Ugpp-E8ucrXSjW3h9n3OhEXbEFSUc4WH44YTxCQZp_a7xvw3HBMP6gu6e_0O9HVSRsQNOD3ZB3yebKLoMOPo04b8ODxSYBtMDULacM89pyIvZEzn-Gu2N_7Eu6mMabqM3KmFzKEsGvTI_3EFWw3YQhalnmpvvLBHELAy6qyctzj-7b0Q-z-1Kg4ga5H15zLw6TyfCNSX8rhcj-Iq61MdSe9_uLZfp0DBIjMWB3ahMw-mleDe1RAyWGGPiKWLqgcXnnOfdM4dJvHzRjfEYXzLY4si6Jpl_TNl0EEieHZYTJODR7DEIzev5-4oMVBE6Q_ouVjXJoh5jWsIaQ8hlNPGQUmn83RoCUmkTeNql00UPApO4STE-zuLdsPKiYR-gSf2YpzPP14PhApSjiwPJ5TxwyvkQqwjygtMZA7wEEVfnzgiJDmIQi7x34hbt53rM61t6Y37ji3m91Lbj79WQW7MpE7CSwqbwD4fgHIKuNzXMBBNwmrcbCqFFWSjfMAG5PYRhWtOD_aXZSW1q0P9zZCQrCNdwNJhRiOTKRAbtxAdnPRx8wak4PSEOkvZ7POuWcvNDBZtJoaA-SL5gBIxcfLRvKMIf_GwSaXYXfuxvqrfrtfylq-nM40dKKBnyxDM7J-vx50jMTPZCcs_8sc1p9HqEPumMBlhiwTc2KA9YUk3soykVuo8OsiHLV9coCCef5ulgpvnTL6KW3idcs7XTMB28dOfDfhKF1VjolclSf8sBey7COfB8Yh1AxzFJRAe17YltpJjgGQ3j54TfDzuumETIU3QhHsS18bQzoLKMYhK1AyhNOoQUROHiOVWxOVTVgXPCaJouNEB9sdpW6Y5kS_IjkMqe478vQx6mtwdjur4CTc8NZaHniAfiNRRkwsHJIsFT7lSVaBt0-rNaqHz_wz23AMplLdu2tL-on2B7rI3bNaH7UM0Vq_qELsWclbJ9ffrPww9mUDPjvnQsf2Rig8T5qi08jqAswSbwDogQHIKuNzXMBBNwmrcfCAFFWSDvTEMcRJf_B4TBbbd1vJAVlkVwIxncttpStCYV1Jpkm1ODIBl7glzTVB7bAMxqAE38Q2mYMkl5Gur228KNoEyWafRheixgNtRPuJQhFLhtmpVEYMBDrt2v_cxQQeDZ13s45xuKnq0Gh1CjJc-S1yjb7OYmZGP2ikcpZgFUwHRU9H-I39Ula3T7A7qfqef-fHmR7qq7ZIhzrpqJtP9Vr5KZTebYnyba2Lyk6jGTHsz6TGvj2OdZ6N5sB0KxB4XBkUlcJiOJVDIurROqAjasPrLheUcfjPcATmcqt_fMvs7sFb0Z1AruOEy8AIECHrGGVqmsC6d7C7QdfawaIUIqp5WCxKDAvQWe25c1SZc9W_29fBW2u0r4CWMx7963xyuTkPSUv2tiEclRNsNOaLx3fVaDF1LJ4cqvvLTSe4OTYSAYsGh3MQotuolQ1sMiVeIlImp5oHg6YICxCWCP-aSitzXr01SNq3VI_quhPGuPxrxlVgb7-afwAAb5dBehZWAAAI7gC0mn8AAFjJALSafwAA4OX_vwAAAABwyQC0mn8AAODl_7-afwAAr4JVehZWAAAI7gC0mn8AAFjJALSafwAAsM0AtJp_AAA', 'APiBAcgq43NcwEE3CatxsK4UVZLIYr7gbmSZYDD5w33W7T1J86x384sts3zfw9QRTSdTpfYuJIgmB1B8fOVjLDM2AgPAdlx6MnYTsOpvb8gKM7CRHvf3he8CwZp3POXHOPsl-k-EgMJeaCtwjYgCO74819K35US_G0uNZVe-TWDa8EgVu6b7vkLKc-_ELACQIN8JGizGCBTIH3JV5P0TPxcQc37GY8oA1fvPxNXzuXcixTXwZiHfFHYRrpyKNEGfV-vVVay8BOPrfZi2LLbBmBPGYsVdzFsCWEoYXElJ2Qx12fnutaPwDYzTt15EnbZpcG4hZgO8D9iGUC2bf8lB8uu0ULzIgtkW_fpRlZmjKDclQh_bjEkza7EDQMQlAPFk7WieeDS98z1v-vjM28zjuSwHvfU4RNc88dFKEjZXvG5p7xulW6-wbzfkW7RZUvmCDckFjdX94yk23LOP4rLLexVNXyDhi07TLGUPAeziViPzehB-X-S4Sbu-6u5_xF1z8f5JQadvAPh_Acgq43NcwEE3CatxcJUUVZJ3r19O1cFfihMk_0RmoEuhpQqN54piN-k2d0xcWeeO7Mtk-ZydSmDLHpGHRb73eM6Dlw3dlPV5LRCf_W9Mxr6uLxQWdhumm6jS_javebrV_ihb_KuI7a8Oh3S9WZCCaTndUTw5JCEiVTWLlgpnPJWGYE19cSYKg_KjwF2SK86Aqy_a8hW3QeNjv5QtrXXOShyvJbdmt-66YRsyrzVfI16noJY7TIkVWv0NkDaVJFUcPZQWje37_5L0C1OBVNspYp22_utRPR1UeubxqdcOGoSoj8cLdEQ5Zdl3NNsM6I7XOQLkcNU0A4yx3-gmHYSgmZFGa4qs7ZNfL0FQawhg98LIpryT8K_bfItebc1SYMtvvokPWSEGt2MDPseQqYeGKVfRdAugjfDCcx7RKMpYJcJnmQ6APYczhUqEScQRifPuegbuGoUNKYOCpHDhdlwcE_mS5I801ZhQIyAxmY4EcqMIUDWb1KRmekRnswxLf4gSbwD4fwHIKuNzXMBBNwmrcbCaFFWSdBieSx_Ahr8jdEYZL3o0nhqXg-05LTq2vL3ea6_f_PEhdkqTM_HAtZfxP0NLuq5JHRxRTj87YA3fWDGO7F4rJV0_-VYdCPMO21NOmOPIgmbkOQdQJfKNxMF2DWbUMcRf99en4EVIVhex7fjsOpRQyv87g1jxzRbYsFofwascTmjWyoZRSB3Bu32ZXVvnYpawefg6N6AKNyjj1uAhqD6pKDfLw0TJNtkOqBV2zti7efp6vI70O0vH634qbmHUNRYT7JbaSSU7RLsRVkd6QVORUHfwRhjW49IWlovdZ5qhuut6bJYiMy4b_JfSG_opqxUkHwbzv1OXX-_jrFA6W-DgyMLruX4k1NPIrzkDbW41lQPCUFkCSdsf2HieP9-wiCbhblLftCxFMDGptDW1nIOJV0vMZRMSymPjsdbNe0PZClTZ9QqI0cO-RJmAwc-pK7G34zi0OZPqPcYr6YHPDHSholT-36o8Di8Pj482lJp-P28A6IEByCrjc1zAQTcJq3FwkhRVkqsYZr9kiQzexvwQgRsCzJ9924hD_1URvk0fiQpYBcHXDXyjmx97KIa0nXfCzWpAHcPMSdJz-HJNvFL3yUeknJqGt9UX0ZBATMYOeFJtpds2NJ496Ecr0ONWR8-xOCSMG5SP1a-UyO4_-qrdlb97_WqvhB60wgYZ0dBxsMPKVy7JzQJD6hDtGaVkAOeja05xTgE0YaaZdFo0dp81jLmRO3ZdPlCdVdpOGtaUzsvK54A4BmfiPHsDt1QHeg0rWRj5VexO5fPel3bjWdqIPP0jzCuioyLxSHqx49KI61Lt4hliv8Tt93fFy8jJL0R-m59nuWgGJMzJywYV1q0kR2XtKo-F1W-_h4D2bWmeQxiTd-U5uTIZi1p8-vWYlQRoe2xoF7kCP55ssyRExZZamMTSOg55k-IpQwpJR3YlVeZj074o32uOH5vvDBL4BCN181CtpRFq1YrCc7ArokHjhuH7GSFDvbl8S7omwihkwb64bZ3R72-afwAAb5dBehZWAADIfQC4mn8AABhZALiafwAA4BWzzJp_AAAwWQC4mn8AAOAVs8yafwAAr4JVehZWAADIfQC4mn8AABhZALiafwAAcF0AuJp_AAA'),
(3, 'hello', 'username', '', '', '', NULL, NULL),
(4, '', 'KING-IMMANUEL GODWIN EDOH', 'nuelluiz@gmail.com', '$2y$10$NflXevborO.OP8UQAovYLufdNDjJxrLDqRms6/ot01HwxyPjWs4Q6', 'user', NULL, NULL),
(5, '', 'KING-IMMANUEL GODWIN EDOH', 'nuelluiz@gmail.com', '$2y$10$JndbcCAF8raRfdNDxCIPVOXd764Onu3S.tRsbWWPUMPedKhSg7ttm', 'user', NULL, NULL),
(6, '', 'KING-IMMANUEL GODWIN EDOH', 'nuelluiz@gmail.com', '$2y$10$hxJ8lgvp.MZjcF7l278SrO3gmNBIixDqEoSSD8uVgwwKqQoX41iVa', 'user', NULL, NULL),
(7, '', 'KING-IMMANUEL GODWIN EDOH', 'nuelluiz2@gmail.com', '$2y$10$uZ1tWdOPwndk0Y/CSIrSL.3QoY3ef27jtrjxyZ4rkqxQLBVyURlKu', 'user', NULL, NULL),
(8, '', 'Uche Mbansso', 'podolski4god9@gmail.com', '$2y$10$bWQ6lwA9ytFQevD0uFU7Q.EzOyQgbzGCWiAbswfdCTRz.WGkJsw2i', 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `rank_level` int(11) NOT NULL CHECK (`rank_level` between 4 and 12),
  `department` enum('Transmission','Distribution','Customer Service','Maintenance') NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `address_staff` varchar(255) NOT NULL,
  `next_of_kin_name` varchar(100) NOT NULL,
  `next_of_kin_phone` varchar(15) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `date_of_birth`, `phone_number`, `rank_level`, `department`, `staff_id`, `address_staff`, `next_of_kin_name`, `next_of_kin_phone`, `updated_at`) VALUES
(1, 4, '2024-09-03', '09099009900', 4, 'Distribution', 'KEDC-1009', 'hello new', 'next kin', '09099009900', '2024-09-29 23:50:49'),
(5, 8, '2024-09-12', '09099009900', 8, 'Transmission', 'KEDC-8571', 'hello new', 'next kin', '09099009900', '2024-09-30 00:11:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
