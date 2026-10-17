drop table if exists public.matchBetweenTables cascade;
drop table if exists public.subject cascade;

create table public.subject (
  id bigint generated always as identity primary key,
  name_subject text not null unique,
  description_ text not null,
  count_of_credits integer not null,
  count_of_hours integer not null
);

insert into public.subject (name_subject, description_, count_of_credits, count_of_hours)
values ('Прикладна прокрастинація', 'Студенти опановують техніки перенесення дедлайнів в власній свідомості, створення ілюзії продуктивності та виконання семестрової роботи за 40 хвилин до її здачі.', 10, 50);

insert into public.subject (name_subject, description_, count_of_credits, count_of_hours)
values ('Прикладна амнезія', 'дослідження вибіркової втрати памʼяті під час запитання викладача', 10, 60);

insert into public.subject (name_subject, description_, count_of_credits, count_of_hours)
values ('Поклоніння whatsapp', 'Молитва єдиному й найзручнішому мессенджеру наукма', 20, 100);

insert into public.subject (name_subject, description_, count_of_credits, count_of_hours)
values ('Програмування', 'бдсм з керелом', 500, 500);

alter table public.subject enable row level security;
drop policy if exists "public read subject" on public.subject;
create policy "public read subject"
  on public.subject for select to anon using (true);
