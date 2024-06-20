bq mk --force=true --dataset thelook_ecommerce
bq mk \
  --transfer_config \
  --data_source=cross_region_copy \
  --target_dataset=thelook_ecommerce \
  --display_name='SQL Talk Sample Data' \
  --schedule_end_time="$(date -u -d '5 mins' +%Y-%m-%dT%H:%M:%SZ)" \
  --params='{
      "source_project_id":"bigquery-public-data",
      "source_dataset_id":"thelook_ecommerce",
      "overwrite_destination_table":"true"
      }'
