json.partial! 'api/components/status'
json.data do
  json.id @voyage.id
  json.from @voyage.from
  json.to @voyage.to
  json.vessel_id @voyage.vessel_id
  json.date @voyage.date.strftime('%Y-%m-%d')
  json.start_time @voyage.start_time.strftime('%H:%M')
  json.end_time @voyage.end_time.strftime('%H:%M')
end
