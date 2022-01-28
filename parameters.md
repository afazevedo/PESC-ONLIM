### ALGORITMOS
- **LP-BB** Exact | MRQ_LP_BB_ECP_BASED_ALG 
- **LP/NLP**-BB Exato | MRQ_LP_NLP_BB_OA_BASED_ALG
- **HOABB** Exato | MRQ_BB_ALG 
- **OA** Exato | MRQ_OA_ALG 
- **ECP** Exato | MRQ_ECP_ALG 
- **ESH** Exato | MRQ_ESH_ALG 
- **BHBB** Exato | MRQ_BONMIN_HYBRID_ALG 
- **FP** Heurística | MRQ_FP_HEUR_ALG 
- **Diving** Heurística | MRQ_DIVE_HEUR_ALG 
- **OAFP** Heurística | MRQ_OA_FP_HEUR_ALG 
- **IGMA1** Exato/Heurística | MRQ_IGMA1_ALG 
- **IGMA2** Heurística | MRQ_IGMA2_ALG 
- **RENS** Heurística | MRQ_RENS_HEUR_ALG 
- **CR** Relax contínua | MRQ_CONT_RELAX_ALG

```julia
open("muriqui_algorithm.opt", "w") do io
    write(io, "MRQ_ECP_ALG")
end;
```

### Parametros double (dbl)
- **in_absolute_convergence_tol**: tolerância de convergência absoluta.
- **in_absolute_feasibility_tol**: tolerância de viabilidade absoluta, utilizada para
determinar se algumas soluções satisfazem as restrições gerais de (P). 
- **in_integer_tol**: tolerância de integralidade. Uma solução é considerada como inteira se o maior gap de integralidade dentre as variáveis inteiras é menor ou igual a
este valor. 
- **in_lower_bound**: limite inferior inicial para a execução dos algoritmos. 
- **in_max_time**: tempo máximo real (no relógio, em segundos) de execução do algoritmo, desde o momento de seu início. 
- **in_max_cpu_time**: tempo máximo de execução (em segundos) em processadores
do algoritmo. 
- **in_relative_convergence_tol**: tolerância de convergência relativa. 
- **in_relative_feasibility_tol**: tolerância de viabilidade relativa, utilizada para determinar se algumas soluções satisfazem as restrições gerais de (P). Valor default:
1.0e − 6;

- **in_upper_bound**: limite superior inicial para a execução dos algoritmos. 

### Parâmetros inteiros (int)

- **in_assume_convexity**: flag que especifica se o problema de entrada deve ser tratado como convexo.
- **in_call_end_of_iteration_callback**: flag que especifica se a callback de final de
iteração deve ser chamada. 
- **in_call_update_best_sol_callback**: flag que especifica se a callback de atualização de solução deve ser chamada. 
- **in_max_iterations**: número máximo de iterações do algoritmo. 
- **in_number_of_threads:** número de threads de execução utilizado pelo algoritmo.
- **in_preprocess_lin_constr**: flag que especifica se deve ser realizado pré-processamento
sobre restrições lineares presentes no problema abordado. 
- **in_preprocess_obj_function**: flag que especifica se deve ser realizado pré-processamento
sobre a função objetivo do problema abordado.
- **in_preprocess_quad_constrs:** flag que especifica se deve ser realizado pré-processamento
sobre restrições quadráticas presentes no problema abordado.
- **in_print_level**: nível de impressão de informações do algoritmo ao longo da execução. 
- **in_print_parameters_values**: flag que especifica se o valor de todos os parâmetros do algoritmo corrente deve ser impresso antes da execução do mesmo.
- **in_printing_frequency**: frequência de impressão de resumo de iteração. 
- **in_set_special_nlp_solver_params**: flag que especifica se parâmetros especiais
do solver NLP devem ser ajustados. 
- **in_store_history_solutions**: flag que especifica se um histórico de soluções deve
ser construído com as soluções viáveis encontradas ao longo das iterações. 
- **in_use_dynamic_constraint_set**: flag que especifica se o Conjunto de Restrição Dinâmico (DCS) deve ser adotado.
- **in_use_initial_solution:** flag que especifica se a solução inicial fornecida pelo
usuário deve ser utilizada pelo algoritmo, por exemplo, como ponto inicial para o
solver NLP.

### Parâmetros string (str)

- **in_milp_solver**: determina o solver MILP adotado pelo algoritmo, quando aplicável. 
- **in_nlp_solver:** determina o solver NLP adotado pelo algoritmo, quando aplicável.

#### Solvers suportados

**MILP**:
- Cbc | MRQ_CBC 
- Cplex | MRQ_CPLEX 
- Glpk | MRQ_GLPK 
- Gurobi | MRQ_GUROBI 
- Knitro | MRQ_MILP_KNITRO 
- Mosek | MRQ_MILP_MOSEK 
- Xpress | MRQ_XPRESS 

**NLP**:
- Ipopt | MRQ_IPOPT 
- Knitro | MRQ_NLP_KNITRO 
- Mosek | MRQ_NLP_MOSEK

```julia
open("muriqui_params.opt", "w") do io
    write(io, "str in_nlp_solver MRQ_NLP_MOSEK\ndbl in_max_cpu_time 600.0\nint in_max_iterations 1000")
end;
```