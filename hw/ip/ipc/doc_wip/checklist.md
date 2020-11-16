---
title: "IPC Checklist"
---

This checklist is for [Hardware Stage]({{<relref "/doc/project/development_stages.md">}}) transitions for the [IPC peripheral][IPC Spec].
All checklist items refer to the content in the [Checklist.]({{<relref "/doc/project/checklist.md">}})

## Design Checklist

### D1

Type          | Item                           | Resolution  | Note/Collaterals
--------------|--------------------------------|-------------|------------------
Documentation | [SPEC_COMPLETE][]              | Done        | [IPC Spec][]
Documentation | [CSR_DEFINED][]                | Done        | [IPC CSR][]
RTL           | [CLKRST_CONNECTED][]           | Done        |
RTL           | [IP_TOP][]                     | Done        |
RTL           | [IP_INSTANTIABLE][]            | Done        |
RTL           | [PHYSICAL_MACROS_DEFINED_80][] | N/A         |
RTL           | [FUNC_IMPLEMENTED][]           | Done        |
RTL           | [ASSERT_KNOWN_ADDED][]         | Done        |
Code Quality  | [LINT_SETUP][]                 | Done        |

[IPC Spec]: ../
[IPC CSR]: ../data/ipc.hjson


[SPEC_COMPLETE]:      {{<relref "/doc/project/checklist.md#spec_complete" >}}
[CSR_DEFINED]:        {{<relref "/doc/project/checklist.md#csr_defined" >}}
[CLKRST_CONNECTED]:   {{<relref "/doc/project/checklist.md#clkrst_connected" >}}
[IP_TOP]:             {{<relref "/doc/project/checklist.md#ip_top" >}}
[IP_INSTANTIABLE]:    {{<relref "/doc/project/checklist.md#ip_instantiable" >}}
[PHYSICAL_MACROS_DEFINED_80]:   {{<relref "/doc/project/checklist.md#physical_macros_defined_80" >}}
[FUNC_IMPLEMENTED]:   {{<relref "/doc/project/checklist.md#func_implemented" >}}
[ASSERT_KNOWN_ADDED]: {{<relref "/doc/project/checklist.md#assert_known_added" >}}
[LINT_SETUP]:         {{<relref "/doc/project/checklist.md#lint_setup" >}}

### D2

Type          | Item                    | Resolution  | Note/Collaterals
--------------|-------------------------|-------------|------------------
Documentation | [NEW_FEATURES][]        | N/A         |
Documentation | [BLOCK_DIAGRAM][]       | N/A         |
Documentation | [DOC_INTERFACE][]       | Done        |
Documentation | [MISSING_FUNC][]        | N/A         |
Documentation | [FEATURE_FROZEN][]      | Done        |
RTL           | [FEATURE_COMPLETE][]    | Done        |
RTL           | [AREA_SANITY_CHECK][]   | Done        |
RTL           | [PORT_FROZEN][]         | Done        |
RTL           | [ARCHITECTURE_FROZEN][] | Done        |
RTL           | [REVIEW_TODO][]         | Done        |
RTL           | [STYLE_X][]             | N/A         | No assignment of X
Code Quality  | [LINT_PASS][]           | Done        | Lint waivers reviewed
Code Quality  | [CDC_SETUP][]           | N/A         | No CDC path
Code Quality  | [FPGA_TIMING][]         | Done        | Fmax 50MHz on NexysVideo
Code Quality  | [CDC_SYNCMACRO][]       | N/A         |
Security      | [SEC_CM_IMPLEMENTED][]  | N/A         |
Security      | [SEC_NON_RESET_FLOPS][] | N/A         |
Security      | [SEC_SHADOW_REGS][]     | N/A         |
Security      | [SEC_RND_CNST][]        | N/A         |

[NEW_FEATURES]:        {{<relref "/doc/project/checklist.md#new_features" >}}
[BLOCK_DIAGRAM]:       {{<relref "/doc/project/checklist.md#block_diagram" >}}
[DOC_INTERFACE]:       {{<relref "/doc/project/checklist.md#doc_interface" >}}
[MISSING_FUNC]:        {{<relref "/doc/project/checklist.md#missing_func" >}}
[FEATURE_FROZEN]:      {{<relref "/doc/project/checklist.md#feature_frozen" >}}
[FEATURE_COMPLETE]:    {{<relref "/doc/project/checklist.md#feature_complete" >}}
[AREA_SANITY_CHECK]:   {{<relref "/doc/project/checklist.md#area_sanity_check" >}}
[PORT_FROZEN]:         {{<relref "/doc/project/checklist.md#port_frozen" >}}
[ARCHITECTURE_FROZEN]: {{<relref "/doc/project/checklist.md#architecture_frozen" >}}
[REVIEW_TODO]:         {{<relref "/doc/project/checklist.md#review_todo" >}}
[STYLE_X]:             {{<relref "/doc/project/checklist.md#style_x" >}}
[LINT_PASS]:           {{<relref "/doc/project/checklist.md#lint_pass" >}}
[CDC_SETUP]:           {{<relref "/doc/project/checklist.md#cdc_setup" >}}
[FPGA_TIMING]:         {{<relref "/doc/project/checklist.md#fpga_timing" >}}
[CDC_SYNCMACRO]:       {{<relref "/doc/project/checklist.md#cdc_syncmacro" >}}
[SEC_CM_IMPLEMENTED]:  {{<relref "/doc/project/checklist.md#sec_cm_implemented" >}}
[SEC_NON_RESET_FLOPS]: {{<relref "/doc/project/checklist.md#sec_non_reset_flops" >}}
[SEC_SHADOW_REGS]:     {{<relref "/doc/project/checklist.md#sec_shadow_regs" >}}
[SEC_RND_CNST]:        {{<relref "/doc/project/checklist.md#sec_rnd_cnst" >}}

### D3

 Type         | Item                    | Resolution  | Note/Collaterals
--------------|-------------------------|-------------|------------------
Documentation | [NEW_FEATURES_D3][]     | N/A         |
RTL           | [TODO_COMPLETE][]       | Done        | No TODO
Code Quality  | [LINT_COMPLETE][]       | Done        |
Code Quality  | [CDC_COMPLETE][]        | N/A         |
Review        | [REVIEW_RTL][]          | Done        | Reviewed by @msfschaffner
Review        | [REVIEW_DELETED_FF][]   | N/A         | Not reported by FPGA tool
Review        | [REVIEW_SW_CSR][]       | Done        |
Review        | [REVIEW_SW_FATAL_ERR][] | Done        |
Review        | [REVIEW_SW_CHANGE][]    | Done        |
Review        | [REVIEW_SW_ERRATA][]    | Done        |
Review        | Reviewer(s)             | Done        | @gkelly @sjgitty @gaurangchitroda
Review        | Signoff date            | Done        | 2019-11-04

[NEW_FEATURES_D3]:      {{<relref "/doc/project/checklist.md#new_features_d3" >}}
[TODO_COMPLETE]:        {{<relref "/doc/project/checklist.md#todo_complete" >}}
[LINT_COMPLETE]:        {{<relref "/doc/project/checklist.md#lint_complete" >}}
[CDC_COMPLETE]:         {{<relref "/doc/project/checklist.md#cdc_complete" >}}
[REVIEW_RTL]:           {{<relref "/doc/project/checklist.md#review_rtl" >}}
[REVIEW_DBG]:           {{<relref "/doc/project/checklist.md#review_dbg" >}}
[REVIEW_DELETED_FF]:    {{<relref "/doc/project/checklist.md#review_deleted_ff" >}}
[REVIEW_SW_CSR]:        {{<relref "/doc/project/checklist.md#review_sw_csr" >}}
[REVIEW_SW_FATAL_ERR]:  {{<relref "/doc/project/checklist.md#review_sw_fatal_err" >}}
[REVIEW_SW_CHANGE]:     {{<relref "/doc/project/checklist.md#review_sw_change" >}}
[REVIEW_SW_ERRATA]:     {{<relref "/doc/project/checklist.md#review_sw_errata" >}}

## Verification Checklist

### V1

 Type         | Item                                  | Resolution      | Note/Collaterals
--------------|---------------------------------------|-----------------|------------------
Documentation | [DV_PLAN_DRAFT_COMPLETED][]           | Done            | [ipc_dv_plan][]
Documentation | [TESTPLAN_COMPLETED][]                | Done            |
Testbench     | [TB_TOP_CREATED][]                    | Done            |
Testbench     | [PRELIMINARY_ASSERTION_CHECKS_ADDED][]| Done            |
Testbench     | [SIM_TB_ENV_CREATED][]                | Done            |
Testbench     | [SIM_RAL_MODEL_GEN_AUTOMATED][]       | Done            |
Testbench     | [CSR_CHECK_GEN_AUTOMATED][]           | waived          | Revisit later. Tool setup in progress.
Testbench     | [TB_GEN_AUTOMATED][]                  | N/A             |
Tests         | [SIM_SANITY_TEST_PASSING][]           | Done            |
Tests         | [SIM_CSR_MEM_TEST_SUITE_PASSING][]    | Done            |
Tests         | [FPV_MAIN_ASSERTIONS_PROVEN][]        | N/A             |
Tool Setup    | [SIM_ALT_TOOL_SETUP][]                | Done            |
Regression    | [SIM_SANITY_REGRESSION_SETUP][]       | Done w/ waivers | Exception (implemented in local)
Regression    | [SIM_NIGHTLY_REGRESSION_SETUP][]      | Done w/ waivers | Exception (implemented in local)
Regression    | [FPV_REGRESSION_SETUP][]              | N/A             |
Coverage      | [SIM_COVERAGE_MODEL_ADDED][]          | Done            |
Integration   | [PRE_VERIFIED_SUB_MODULES_V1][]       | N/A             |
Review        | [DESIGN_SPEC_REVIEWED][]              | Done            |
Review        | [DV_PLAN_TESTPLAN_REVIEWED][]         | Done            |
Review        | [STD_TEST_CATEGORIES_PLANNED][]       | Done            | Exception (Security, Power, Debug)
Review        | [V2_CHECKLIST_SCOPED][]               | Done            |

[ipc_dv_plan]: {{<relref "/hw/ip/ipc/doc/dv_plan/index.md">}}

[DV_PLAN_DRAFT_COMPLETED]:            {{<relref "/doc/project/checklist.md#dv_plan_draft_completed" >}}
[TESTPLAN_COMPLETED]:                 {{<relref "/doc/project/checklist.md#testplan_completed" >}}
[TB_TOP_CREATED]:                     {{<relref "/doc/project/checklist.md#tb_top_created" >}}
[PRELIMINARY_ASSERTION_CHECKS_ADDED]: {{<relref "/doc/project/checklist.md#preliminary_assertion_checks_added" >}}
[SIM_TB_ENV_CREATED]:                 {{<relref "/doc/project/checklist.md#sim_tb_env_created" >}}
[SIM_RAL_MODEL_GEN_AUTOMATED]:        {{<relref "/doc/project/checklist.md#sim_ral_model_gen_automated" >}}
[CSR_CHECK_GEN_AUTOMATED]:            {{<relref "/doc/project/checklist.md#csr_check_gen_automated" >}}
[TB_GEN_AUTOMATED]:                   {{<relref "/doc/project/checklist.md#tb_gen_automated" >}}
[SIM_SANITY_TEST_PASSING]:            {{<relref "/doc/project/checklist.md#sim_sanity_test_passing" >}}
[SIM_CSR_MEM_TEST_SUITE_PASSING]:     {{<relref "/doc/project/checklist.md#sim_csr_mem_test_suite_passing" >}}
[FPV_MAIN_ASSERTIONS_PROVEN]:         {{<relref "/doc/project/checklist.md#fpv_main_assertions_proven" >}}
[SIM_ALT_TOOL_SETUP]:                 {{<relref "/doc/project/checklist.md#sim_alt_tool_setup" >}}
[SIM_SANITY_REGRESSION_SETUP]:        {{<relref "/doc/project/checklist.md#sim_sanity_regression_setup" >}}
[SIM_NIGHTLY_REGRESSION_SETUP]:       {{<relref "/doc/project/checklist.md#sim_nightly_regression_setup" >}}
[FPV_REGRESSION_SETUP]:               {{<relref "/doc/project/checklist.md#fpv_regression_setup" >}}
[SIM_COVERAGE_MODEL_ADDED]:           {{<relref "/doc/project/checklist.md#sim_coverage_model_added" >}}
[PRE_VERIFIED_SUB_MODULES_V1]:        {{<relref "/doc/project/checklist.md#pre_verified_sub_modules_v1" >}}
[DESIGN_SPEC_REVIEWED]:               {{<relref "/doc/project/checklist.md#design_spec_reviewed" >}}
[DV_PLAN_TESTPLAN_REVIEWED]:          {{<relref "/doc/project/checklist.md#dv_plan_testplan_reviewed" >}}
[STD_TEST_CATEGORIES_PLANNED]:        {{<relref "/doc/project/checklist.md#std_test_categories_planned" >}}
[V2_CHECKLIST_SCOPED]:                {{<relref "/doc/project/checklist.md#v2_checklist_scoped" >}}
