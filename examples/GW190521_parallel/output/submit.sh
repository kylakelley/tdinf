#!/usr/bin/env bash
function get_id() {
    if [[ "$1" =~ Submitted\ batch\ job\ ([0-9]+) ]]; then
        echo "${BASH_REMATCH[1]}"
    else
        echo "sbatch failed"
        exit 1
    fi
}

cd /home/kgk3/tdinf/examples/GW190521_parallel/output

run_ids=()
run_ids+=($(get_id "$(sbatch -t 3-0 --mem=60G -p hpc -n 1 -c 128 --job-name pre_-0.05seconds --export=ALL,LAL_DATA_PATH=$LAL_DATA_PATH --wrap="bash /home/kgk3/tdinf/examples/GW190521_parallel/output/tasks_run_pre_-0.05seconds.txt")"))
run_ids+=($(get_id "$(sbatch -t 3-0 --mem=60G -p hpc -n 1 -c 128 --job-name full_0.0seconds --export=ALL,LAL_DATA_PATH=$LAL_DATA_PATH --wrap="bash /home/kgk3/tdinf/examples/GW190521_parallel/output/tasks_run_full_0.0seconds.txt")"))
run_ids+=($(get_id "$(sbatch -t 3-0 --mem=60G -p hpc -n 1 -c 128 --job-name pre_0.0seconds --export=ALL,LAL_DATA_PATH=$LAL_DATA_PATH --wrap="bash /home/kgk3/tdinf/examples/GW190521_parallel/output/tasks_run_pre_0.0seconds.txt")"))
run_ids+=($(get_id "$(sbatch -t 3-0 --mem=60G -p hpc -n 1 -c 128 --job-name pre_0.05seconds --export=ALL,LAL_DATA_PATH=$LAL_DATA_PATH --wrap="bash /home/kgk3/tdinf/examples/GW190521_parallel/output/tasks_run_pre_0.05seconds.txt")"))

# Build afterok dependency string from all run job IDs
dep="afterok"
for id in "${run_ids[@]}"; do dep="$dep:$id"; done
waveid=$(get_id "$(sbatch -t 3-0 --mem=60G --dependency=$dep -p hpc -n 1 -c 128 --job-name waveforms --export=ALL,LAL_DATA_PATH=$LAL_DATA_PATH --wrap="bash /home/kgk3/tdinf/examples/GW190521_parallel/output/tasks_waveforms.txt")")

cd -
